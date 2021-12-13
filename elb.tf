#---------------------------------------------------------------
# Create EC2 ELB
#---------------------------------------------------------------

resource "aws_elb" "ec2_elb" {
  count           = var.enable_elb ? 1 : 0
  name            = var.lb_name == "" ? "${var.global_product}-${var.global_environment}-${var.tag_role}-ec2-elb" : var.lb_name
  subnets         = var.elb_subnets
  security_groups = [aws_security_group.ec2_elb[0].id]
  internal        = var.ec2_elb_internal
  instances       = local.elb_instances

  listener {
    instance_port      = var.listener_instance_port
    instance_protocol  = var.listener_instance_protocol
    lb_port            = var.listener_lb_port
    lb_protocol        = var.listener_lb_protocol
    ssl_certificate_id = var.ssl_cert_arn
  }

  health_check {
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
    timeout             = var.health_check_timeout
    target              = var.health_check_target
    interval            = var.health_check_interval
  }

  idle_timeout                = var.idle_timeout
  connection_draining         = var.connection_draining
  connection_draining_timeout = var.connection_draining_timeout

  tags = {
    Name          = "${var.tag_product == "" ? var.global_product : var.tag_product}-${var.global_environment}-${var.tag_role}-ec2-elb"
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
