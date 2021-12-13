#--------------------------------------------------------------
# Global Variables
#--------------------------------------------------------------

variable "global_phz_id" {
  description = "The domain ID of this VPC's domain"
}

variable "global_phz_domain" {
  description = "The domain for this VPC"
}

variable "global_key_name" {
  description = "SSH key name in your AWS account for AWS instances"
}

variable "global_subnet_id" {
  description = "The ID of the subnet to deploy the OSSEC Server into"
}

variable "global_vpc_id" {
  description = "The ID of the VPC where the bastion stack is being deployed"
}

variable "global_product" {
  description = "The overarching Product (everything in this VPC will be named after it)"
}

variable "global_environment" {
  description = "The Application environment (dev, uat, sit, prod, etc)"
}

variable "elsevier_cidr_blocks" {
  description = "Elsevier CIDR ranges that are granted access"
}

#--------------------------------------------------------------
# Tagging
#--------------------------------------------------------------

variable "tag_role" {
  description = "The tag required by our tagging statndard"
}

variable "tag_environment" {
  description = "Tag for application environment (dev, uat, sit, prod, etc)"
}

variable "tag_product" {
  description = "Tag for product the resource is used by)"
}

variable "tag_orchestration" {
  description = "Source that created resource normally git repo"
}

variable "tag_costcode" {
  description = "The costcentre code to tag"
}

variable "tag_cpmbackup" {
  description = "whether resource needs backing up"
  default     = "no-backup"
}

variable "tag_description" {
  description = "What is it, multiple words separated by \"_\". Used with product, environmental role to create the \"name\" tag"
}

variable "tag_contact" {
  description = "The contact label to tag resources"
  default     = "els-tech-tio-bts-cloud@elsevier.com"
}

variable "tag_subproduct" {
  description = "Used where an AWS account runs more than one service"
}

variable "tag_tioce_scheduler" {
  description = "Tag that can be used to schedule instances using TIO CE Scheduler module, https://github.com/elsevier-centraltechnology/bts-terraform-bootstrap-scheduler"
  default     = ""
}

variable "rootvol_cpm_backup" {
  description = "Tag for custom cpm backup on root volume"
  default     = ""
}

variable "vol1_cpm_backup" {
  description = "Tag for custom cpm backup on additional volume 1"
  default     = ""
}

variable "vol2_cpm_backup" {
  description = "Tag for custom cpm backup on additional volume 2"
  default     = ""
}

variable "vol3_cpm_backup" {
  description = "Tag for custom cpm backup on additional volume 3"
  default     = ""
}

variable "vol4_cpm_backup" {
  description = "Tag for custom cpm backup on additional volume 4"
  default     = ""
}

variable "vol5_cpm_backup" {
  description = "Tag for custom cpm backup on additional volume 5"
  default     = ""
}

variable "vol6_cpm_backup" {
  description = "Tag for custom cpm backup on additional volume 6"
  default     = ""
}

#--------------------------------------------------------------
# EC2
#--------------------------------------------------------------

variable "ec2_instance_type" {
  default     = "t2.nano"
  description = "The instance type"
}

variable "ec2_ami" {
  description = "The AMI for the machine"
}

variable "ec2_user_data" {
  default     = ""
  description = "The path to a file with user_data for the instances"
}

variable "ec2_name" {
  default     = ""
  description = "The name of the instance"
}

variable "ec2_hostrecord" {
  description = "The DNS name the server should answer on"
}

variable "ec2_rootvol_size" {
  default     = "10"
  description = "The size of the Root Volume in GB"
}

variable "ec2_rootvol_type" {
  default     = "gp3"
  description = "Type of volume"
}

variable "ec2_rootvol_iops" {
  default     = "3000"
  description = "Amount of provisioned IOPS. Only valid for volume_type of io1, io2 or gp3."
}

variable "ec2_rootvol_throughput" {
  description = "The throughput that the volume supports, in MiB/s. Only valid for type of gp3."
  default     = "125"
}

variable "ec2_role" {
  description = "The Role used by puppet example mgmt, db, web, etc)"
}

variable "ec2_security_group_list" {
  default     = []
  description = "List of security groups to attach to the EC2 instance"
  type        = list
}

variable "ec2_assoc_pub_ip" {
  description = "Boolean whether or not to associate a public IP with the instance"
  default     = "false"
}

variable "ec2_delete_root_volume_on_termination" {
  description = "boolean whether the root volume deletes on termination of the instance"
  default     = "true"
}

variable "puppetenvironment" {
  description = "Puppet Environment, or git branch"
  default     = "master"
}

variable "make_default_sgs" {
  description = "Default setting is on and will create default SGs. Set to false to stop making defaults SGs"
  default     = "true"
}

variable "default_sg_name" {
  description = "Setup custom name for security group"
  default     = ""
}

variable "default_role_name" {
  description = "Setup custom name for ec2 role"
  default     = ""
}

variable "default_profile_name" {
  description = "Setup custom name for ec2 profile"
  default     = ""
}


#--------------------------------------------------------------
# EBS
#--------------------------------------------------------------

variable "ebs_optimized" {
  description = "Enables or disabled ebs_optimized option, may be required if you change instance size"
  default     = null
}

variable "volume_type" {
  description = "The type of EBS volume"
  default     = "gp3"
}

variable "vol1_size" {
  description = "Size of additional volume 1, added only if this is not blank"
  default     = ""
}

variable "vol2_size" {
  description = "Size of additional volume 2, added only if this is not blank"
  default     = ""
}

variable "vol3_size" {
  description = "Size of additional volume 3, added only if this is not blank"
  default     = ""
}

variable "vol4_size" {
  description = "Size of additional volume 4, added only if this is not blank"
  default     = ""
}

variable "vol5_size" {
  description = "Size of additional volume 5, added only if this is not blank"
  default     = ""
}

variable "vol6_size" {
  description = "Size of additional volume 6, added only if this is not blank"
  default     = ""
}

variable "encrypted" {
  description = "Whether to encrypt the additional disks attached"
  default     = "false"
}

variable "kms_key" {
  description = "KMS key ARN, required if disks are encrypted"
  default     = ""
}

variable "vol1_name" {
  description = "Give additional volume 1 a custom device name"
  default     = "/dev/xvdc"
}

variable "vol2_name" {
  description = "Give additional volume 2 a custom device name"
  default     = "/dev/xvdd"
}

variable "vol3_name" {
  description = "Give additional volume 3 a custom device name"
  default     = "/dev/xvde"
}

variable "vol4_name" {
  description = "Give additional volume 4 a custom device name"
  default     = "/dev/xvdf"
}

variable "vol5_name" {
  description = "Give additional volume 5 a custom device name"
  default     = "/dev/xvdg"
}

variable "vol6_name" {
  description = "Give additional volume 6 a custom device name"
  default     = "/dev/xvdh"
}

variable "vol1_iops" {
  description = "The amount of IOPS to provision for the disk. Only valid for type of io1, io2 or gp3."
  default     = "3000"
}

variable "vol2_iops" {
  description = "The amount of IOPS to provision for the disk. Only valid for type of io1, io2 or gp3."
  default     = "3000"
}

variable "vol3_iops" {
  description = "The amount of IOPS to provision for the disk. Only valid for type of io1, io2 or gp3."
  default     = "3000"
}

variable "vol4_iops" {
  description = "The amount of IOPS to provision for the disk. Only valid for type of io1, io2 or gp3."
  default     = "3000"
}

variable "vol5_iops" {
  description = "The amount of IOPS to provision for the disk. Only valid for type of io1, io2 or gp3."
  default     = "3000"
}

variable "vol6_iops" {
  description = "The amount of IOPS to provision for the disk. Only valid for type of io1, io2 or gp3."
  default     = "3000"
}

variable "vol1_throughput" {
  description = "The throughput that the volume supports, in MiB/s. Only valid for type of gp3."
  default     = "125"
}

variable "vol2_throughput" {
  description = "The throughput that the volume supports, in MiB/s. Only valid for type of gp3."
  default     = "125"
}

variable "vol3_throughput" {
  description = "The throughput that the volume supports, in MiB/s. Only valid for type of gp3."
  default     = "125"
}

variable "vol4_throughput" {
  description = "The throughput that the volume supports, in MiB/s. Only valid for type of gp3."
  default     = "125"
}

variable "vol5_throughput" {
  description = "The throughput that the volume supports, in MiB/s. Only valid for type of gp3."
  default     = "125"
}

variable "vol6_throughput" {
  description = "The throughput that the volume supports, in MiB/s. Only valid for type of gp3."
  default     = "125"
}

#--------------------------------------------------------------
# ELB
#--------------------------------------------------------------

variable "lb_name" {
  description = "Set a custom lb name"
  default     = ""
}

variable "elb_cidr_blocks" {
  description = "Access to the ELB, this can be internal or external IP addresses"
  default     = ""
}

variable "ec2_elb_internal" {
  description = "Set the ELB to be internal or external to the network, default internal"
  default     = "true"
}

variable "listener_instance_port" {
  description = "ELB targetlistener port"
  default     = ""
}

variable "listener_instance_protocol" {
  description = "ELB Target protocol lister is using, TCP or UDP"
  default     = "http"
}

variable "listener_lb_port" {
  description = "port ELB will listen on"
  default     = ""
}

variable "listener_lb_protocol" {
  description = "ELB listenr protocol, tcp, udp, https"
  default     = "https"
}

variable "health_check_healthy_threshold" {
  description = "Health check for ELB"
  default     = ""
}

variable "health_check_unhealthy_threshold" {
  description = "Health check for ELB"
  default     = ""
}

variable "health_check_timeout" {
  description = "Health check for ELB"
  default     = ""
}

variable "health_check_target" {
  description = "Health check for ELB"
  default     = ""
}

variable "health_check_interval" {
  description = "Health check for ELB"
  default     = ""
}

variable "idle_timeout" {
  description = "idle timeout for elb"
  default     = ""
}

variable "connection_draining" {
  description = "enable connection draining on ELB"
  default     = ""
}

variable "connection_draining_timeout" {
  description = "enable connection draining on ELB"
  default     = ""
}

variable "ssl_cert_arn" {
  description = "The SSL Cert for your ELB, if using ssl"
  default     = ""
}

variable "elb_subnets" {
  type        = list(string)
  description = "subnest you want your elb to live in"
  default     = [""]
}

variable "ec2_elb_cname" {
  description = "Set your route53 entry for your ELB"
  default     = ""
}

variable "enable_elb" {
  description = "Default setting is off, set to true to enable the ELB and related security groups"
  default     = "false"
}

variable "alt_elb_phz_id" {
  description = "phz ID for additonal route 53 ELB"
  default     = ""
}

variable "alt_elb_cname" {
  description = "cname for alternative route 53 record, if required"
  default     = ""
}

variable "elb_net_protocol" {
  description = "Protocol which the EC2 instance accepts traffic, should be TCP or UDP"
  default     = "tcp"
}

variable "elb_instances" {
  description = "Add multiple instances to the ELB"
  default     = []
}

variable "evaluate_target_health" {
  description = "True if you want Route 53 to use this record to respond to DNS queries only if the specified AWS resource is healthy"
  default     = true
}

variable "custom_tags" {
  description = "Adds custom tags to EC2 resource"
  type        = map(string)
  default     = {}
}
