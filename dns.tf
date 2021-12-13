#--------------------------------------------------------------
# Host Record
#--------------------------------------------------------------
resource "aws_route53_record" "ec2-server" {
  count   = var.ec2_assoc_pub_ip ? 0 : 1
  zone_id = var.global_phz_id
  name    = "${var.ec2_hostrecord}.${var.global_phz_domain}"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.ec2.private_ip]
}

resource "aws_route53_record" "ec2_elb" {
  count   = var.enable_elb ? 1 : 0
  zone_id = var.alt_elb_phz_id == "" ? var.global_phz_id : var.alt_elb_phz_id
  name    = var.alt_elb_cname == "" ? var.ec2_elb_cname : var.alt_elb_cname
  type    = "A"

  alias {
    name                   = aws_elb.ec2_elb[0].dns_name
    zone_id                = aws_elb.ec2_elb[0].zone_id
    evaluate_target_health = var.evaluate_target_health
  }
}

resource "aws_route53_record" "ec2-server-public" {
  count   = var.ec2_assoc_pub_ip ? 1 : 0
  zone_id = var.global_phz_id
  name    = "${var.ec2_hostrecord}.${var.global_phz_domain}"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.ec2.public_ip]
}
