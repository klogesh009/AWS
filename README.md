terraform-ec2
=================

This module requires Terraform v0.12. Please ensure your Terraform control repository is aligned as required.

From 3.0.0, this module requires Terraform v0.13.

### Overview

A terraform module for creating an EC2 instance in a targeted AWS account.

This creates and configures the resources listed below:

- internal ec2 instance
- iam role & instance profile for ec2 instance
- vpc security group assigned to the ec2 instance  
- internal/external route53 A record

In addition to the EC2 instance, you can also use this module to create and configure the below resources:

- internal/external elb
- vpc security group assigned to the elb
- route53 record for elb
- up to 6 additional EBS volumes

This module makes the following assumptions:
* You have a VPC
* You have private subnets for your VPC

## Inputs

For inputs, please view the variables.tf file

## Outputs

| Name | Description |
|------|-------------|
| ec2\_sg\_id| The id of the EC2 SG |
| ec2\_instance\_id | The id of the EC2 instance |
| ec2\_private\_ip | The private IP address of the EC2 instance |
| ec2\_public\_ip | If public, the public IP address of the EC2 instance |
| ec2\_role\_id | The id of the EC2 IAM role |
| elb\_sg\_id | The id of the ELB SG |  
| elb\_id | The id of the ELB |
| instance\_az | The availability zones for the EC2 instance |

### Usage  

To create a standard EC2 instance with no additional requirements, please use the module as below:

```
module "ec2" {
  source = "git::ssh://git@github.com/sudhakaranr87/terraform-ec2.git"

  global_vpc_id        = "vpc-id"
  global_subnet_id     = "subnet-id"
  global_phz_id        = var.phz_id
  global_phz_domain    = var.phz_domain
  global_environment   = var.environment
  global_product       = var.product
  global_key_name      = var.key_name
  ec2_instance_type    = "t3.medium"
  ec2_ami              = "ami-id"
  ec2_hostrecord       = "host-name"
  ec2_rootvol_size     = "volume-size"
  ec2_role             = "type-of-server"
  enable_elb           = "true-to-enable"
  elsevier_cidr_blocks = var.cidr_blocks
  tag_subproduct       = var.sub_product
  tag_cpmbackup        = var.cpm_backup
  tag_costcode         = var.costcode
  tag_environment      = var.environment
  tag_product          = var.product
  tag_orchestration    = var.orchestration
  tag_description      = "my_first_app_db"
  tag_role             = "type-of-server"
  tag_contact          = var.contact
}
```
