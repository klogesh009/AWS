#--------------------------------------------------------------
# EC2 SG
#--------------------------------------------------------------
resource "aws_security_group" "els-tio-ec2-sg" {
  count       = var.make_default_sgs ? 1 : 0
  name        = var.default_sg_name == "" ? "${var.global_product}.${var.global_environment}.${var.tag_role}-sg" : var.default_sg_name
  description = var.default_sg_name == "" ? "Security group for ${var.global_product}.${var.global_environment}.${var.tag_role}-sg" : "Security group for ${var.default_sg_name}"
  vpc_id      = var.global_vpc_id

  tags = {
    Name          = "${var.global_product}.${var.global_environment}.${var.tag_role}-sg"
    SubProduct    = var.tag_subproduct
    CostCode      = var.tag_costcode
    Orchestration = var.tag_orchestration
    Product       = var.tag_product
    Environment   = var.tag_environment
    Description   = var.tag_description
    Role          = var.tag_role
    Contact       = var.tag_contact
  }

}

# Authorize specific inbound traffic.
resource "aws_security_group_rule" "RDP_from_elsevier" {
  count             = var.make_default_sgs ? 1 : 0
  type              = "ingress"
  from_port         = 3389
  to_port           = 3389
  protocol          = "tcp"
  security_group_id = aws_security_group.els-tio-ec2-sg[0].id
  cidr_blocks       = split(",", var.elsevier_cidr_blocks)
}

resource "aws_security_group_rule" "self" {
  count             = var.make_default_sgs ? 1 : 0
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.els-tio-ec2-sg[0].id
  self              = true
}

resource "aws_security_group_rule" "SSH_from_elsevier" {
  count             = var.make_default_sgs ? 1 : 0
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.els-tio-ec2-sg[0].id
  cidr_blocks       = split(",", var.elsevier_cidr_blocks)
}

# Authorize all outbound traffic.
resource "aws_security_group_rule" "all_outbound" {
  count             = var.make_default_sgs ? 1 : 0
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.els-tio-ec2-sg[0].id
  cidr_blocks       = ["0.0.0.0/0"]
}

# Authorize ELB inbound traffic if ELB is created.
resource "aws_security_group_rule" "ec2_elb_inbound" {
  count                    = var.make_default_sgs && var.enable_elb ? 1 : 0
  type                     = "ingress"
  from_port                = var.listener_instance_port
  to_port                  = var.listener_instance_port
  protocol                 = var.elb_net_protocol
  security_group_id        = aws_security_group.els-tio-ec2-sg[0].id
  source_security_group_id = aws_security_group.ec2_elb[0].id
}

# ELB Security Group
resource "aws_security_group" "ec2_elb" {
  count       = var.enable_elb ? 1 : 0
  name        = "${var.global_product}.${var.global_environment}.${var.tag_role}.ec2.elb.sg"
  description = "EC2 ${var.ec2_role} ELB SG"
  vpc_id      = var.global_vpc_id

  tags = {
    Product       = var.tag_product == "" ? var.global_product : var.tag_product
    SubProduct    = var.tag_subproduct
    CostCode      = var.tag_costcode
    Orchestration = var.tag_orchestration
    Product       = var.tag_product
    Environment   = var.tag_environment
    Description   = var.tag_description
    Role          = var.tag_role
    Contact       = var.tag_contact
  }
}

# Authorize specific inbound traffic.
resource "aws_security_group_rule" "elb_access" {
  count             = var.enable_elb ? 1 : 0
  type              = "ingress"
  from_port         = var.listener_lb_port
  to_port           = var.listener_lb_port
  protocol          = "tcp"
  security_group_id = aws_security_group.ec2_elb[0].id
  cidr_blocks       = split(",", var.elb_cidr_blocks)
}

# Authorize all outbound traffic.
resource "aws_security_group_rule" "ec2_outbound" {
  count             = var.enable_elb ? 1 : 0
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.ec2_elb[0].id
  cidr_blocks       = ["0.0.0.0/0"]
}
