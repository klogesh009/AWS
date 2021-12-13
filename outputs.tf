output "ec2_sg_id" {
  value = element(concat(aws_security_group.els-tio-ec2-sg.*.id, [""]), 0)
}

output "ec2_instance_id" {
  value = aws_instance.ec2.id
}

output "ec2_private_ip" {
  value = aws_instance.ec2.private_ip
}

output "ec2_public_ip" {
  value = aws_instance.ec2.public_ip
}

output "ec2_role_id" {
  value = aws_iam_role.ec2_role.id
}

output "elb_sg_id" {
  value = element(concat(aws_security_group.ec2_elb.*.id, [""]), 0)
}

output "elb_id" {
  value = element(concat(aws_elb.ec2_elb.*.id, [""]), 0)
}

output "instance_az" {
  value = [aws_instance.ec2.*.availability_zone]
}
