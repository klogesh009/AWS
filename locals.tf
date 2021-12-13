locals {
  elb_instances = concat(
    [aws_instance.ec2.id],
    var.elb_instances
  )
}

locals {
  common_tags = {
    Name            = var.ec2_name != "" ? var.ec2_name : "${var.global_product}.${var.global_environment}.${var.tag_role}"
    SubProduct      = var.tag_subproduct
    "cpm backup"    = var.tag_cpmbackup
    CostCode        = var.tag_costcode
    Orchestration   = var.tag_orchestration
    Product         = var.tag_product
    Environment     = var.tag_environment
    Description     = var.tag_description
    Role            = var.tag_role
    Contact         = var.tag_contact
    tioce-scheduler = var.tag_tioce_scheduler
  }
}

locals {
  common_volume_tags = {
    Product       = var.tag_product == "" ? var.global_product : var.tag_product
    CostCode      = var.tag_costcode
    Orchestration = var.tag_orchestration
    Product       = var.tag_product
    Environment   = var.tag_environment
    Description   = var.tag_description
    Role          = var.tag_role
    Contact       = var.tag_contact
  }
}
