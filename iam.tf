#--------------------------------------------------------------
# IAM Instance Profile
#--------------------------------------------------------------
resource "aws_iam_instance_profile" "ec2_profile" {
  depends_on = [aws_iam_role.ec2_role]
  name       = var.default_profile_name == "" ? "${var.global_product}.${var.global_environment}.${var.tag_role}.ec2-profile" : var.default_profile_name
  role       = aws_iam_role.ec2_role.name
}

#--------------------------------------------------------------
# IAM Role
#--------------------------------------------------------------
resource "aws_iam_role" "ec2_role" {
  name               = var.default_role_name == "" ? "${var.global_product}.${var.global_environment}.${var.tag_role}.ec2-role" : var.default_role_name
  path               = "/"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
