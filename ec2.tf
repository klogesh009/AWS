#--------------------------------------------------------------
# EC2 Instance
#--------------------------------------------------------------
resource "aws_instance" "ec2" {

  key_name      = var.global_key_name
  subnet_id     = var.global_subnet_id
  instance_type = var.ec2_instance_type
  ebs_optimized = var.ebs_optimized

  root_block_device {
    delete_on_termination = var.ec2_delete_root_volume_on_termination
    volume_size           = var.ec2_rootvol_size
    volume_type           = var.ec2_rootvol_type
    iops                  = var.ec2_rootvol_iops
    throughput            = var.ec2_rootvol_throughput
    tags = {
      "cpm backup" = var.rootvol_cpm_backup != "" ? var.rootvol_cpm_backup : "no-backup"
    }
  }

  ami                         = var.ec2_ami
  vpc_security_group_ids      = length(var.ec2_security_group_list) != 0 ? var.ec2_security_group_list : [aws_security_group.els-tio-ec2-sg[0].id]
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.id
  associate_public_ip_address = var.ec2_assoc_pub_ip

  tags = merge(
    local.common_tags,
    var.custom_tags,
  )

  user_data = data.template_file.userdata.rendered

  lifecycle {
    ignore_changes = [user_data]
  }
}

#--------------------------------------------------------------
# User Data Variables
#--------------------------------------------------------------

data "template_file" "userdata" {
  template = var.ec2_user_data

  vars = {
    appliedhostname   = var.ec2_hostrecord
    domain_name       = var.global_phz_domain
    product           = var.global_product
    environment       = var.global_environment
    role              = var.ec2_role
    puppetenvironment = var.puppetenvironment
  }
}
