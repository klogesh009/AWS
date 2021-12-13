resource "aws_ebs_volume" "vol1" {
  # only create if a value is set for the size
  count             = var.vol1_size != "" ? 1 : 0
  availability_zone = aws_instance.ec2.availability_zone
  size              = var.vol1_size
  type              = var.volume_type
  iops              = var.vol1_iops
  throughput        = var.vol1_throughput
  encrypted         = var.encrypted
  kms_key_id        = var.kms_key

  tags = merge(
    local.common_volume_tags,
    var.tag_subproduct != "" ? { "SubProduct" = var.tag_subproduct } : {},
    var.vol1_cpm_backup != "" ? { "cpm backup" = var.vol1_cpm_backup } : {},
  )
}

resource "aws_ebs_volume" "vol2" {
  # only create if a value is set for the size
  count             = var.vol2_size != "" ? 1 : 0
  availability_zone = aws_instance.ec2.availability_zone
  size              = var.vol2_size
  type              = var.volume_type
  iops              = var.vol2_iops
  throughput        = var.vol2_throughput
  encrypted         = var.encrypted
  kms_key_id        = var.kms_key

  tags = merge(
    local.common_volume_tags,
    var.tag_subproduct != "" ? { "SubProduct" = var.tag_subproduct } : {},
    var.vol2_cpm_backup != "" ? { "cpm backup" = var.vol2_cpm_backup } : {},
  )
}

resource "aws_ebs_volume" "vol3" {
  # only create if a value is set for the size
  count             = var.vol3_size != "" ? 1 : 0
  availability_zone = aws_instance.ec2.availability_zone
  size              = var.vol3_size
  type              = var.volume_type
  iops              = var.vol3_iops
  throughput        = var.vol3_throughput
  encrypted         = var.encrypted
  kms_key_id        = var.kms_key

  tags = merge(
    local.common_volume_tags,
    var.tag_subproduct != "" ? { "SubProduct" = var.tag_subproduct } : {},
    var.vol3_cpm_backup != "" ? { "cpm backup" = var.vol3_cpm_backup } : {},
  )
}

resource "aws_ebs_volume" "vol4" {
  # only create if a value is set for the size
  count             = var.vol4_size != "" ? 1 : 0
  availability_zone = aws_instance.ec2.availability_zone
  size              = var.vol4_size
  type              = var.volume_type
  iops              = var.vol4_iops
  throughput        = var.vol4_throughput
  encrypted         = var.encrypted
  kms_key_id        = var.kms_key

  tags = merge(
    local.common_volume_tags,
    var.tag_subproduct != "" ? { "SubProduct" = var.tag_subproduct } : {},
    var.vol4_cpm_backup != "" ? { "cpm backup" = var.vol4_cpm_backup } : {},
  )
}

resource "aws_ebs_volume" "vol5" {
  # only create if a value is set for the size
  count             = var.vol5_size != "" ? 1 : 0
  availability_zone = aws_instance.ec2.availability_zone
  size              = var.vol5_size
  type              = var.volume_type
  iops              = var.vol5_iops
  throughput        = var.vol5_throughput
  encrypted         = var.encrypted
  kms_key_id        = var.kms_key

  tags = merge(
    local.common_volume_tags,
    var.tag_subproduct != "" ? { "SubProduct" = var.tag_subproduct } : {},
    var.vol5_cpm_backup != "" ? { "cpm backup" = var.vol5_cpm_backup } : {},
  )
}

resource "aws_ebs_volume" "vol6" {
  # only create if a value is set for the size
  count             = var.vol6_size != "" ? 1 : 0
  availability_zone = aws_instance.ec2.availability_zone
  size              = var.vol6_size
  type              = var.volume_type
  iops              = var.vol6_iops
  throughput        = var.vol6_throughput
  encrypted         = var.encrypted
  kms_key_id        = var.kms_key

  tags = merge(
    local.common_volume_tags,
    var.tag_subproduct != "" ? { "SubProduct" = var.tag_subproduct } : {},
    var.vol6_cpm_backup != "" ? { "cpm backup" = var.vol6_cpm_backup } : {},
  )
}

#---------------------------------------------------------------
# ec2 attachments
#---------------------------------------------------------------
resource "aws_volume_attachment" "attach_vol1" {
  count       = var.vol1_size != "" ? 1 : 0
  device_name = var.vol1_name
  volume_id   = element(aws_ebs_volume.vol1.*.id, count.index)
  instance_id = aws_instance.ec2.id

  lifecycle {
    ignore_changes = [
      volume_id,
      instance_id,
    ]
  }
}

resource "aws_volume_attachment" "attach_vol2" {
  count       = var.vol2_size != "" ? 1 : 0
  device_name = var.vol2_name
  volume_id   = element(aws_ebs_volume.vol2.*.id, count.index)
  instance_id = aws_instance.ec2.id

  lifecycle {
    ignore_changes = [
      volume_id,
      instance_id,
    ]
  }
}

resource "aws_volume_attachment" "attach_vol3" {
  count       = var.vol3_size != "" ? 1 : 0
  device_name = var.vol3_name
  volume_id   = element(aws_ebs_volume.vol3.*.id, count.index)
  instance_id = aws_instance.ec2.id

  lifecycle {
    ignore_changes = [
      volume_id,
      instance_id,
    ]
  }
}

resource "aws_volume_attachment" "attach_vol4" {
  count       = var.vol4_size != "" ? 1 : 0
  device_name = var.vol4_name
  volume_id   = element(aws_ebs_volume.vol4.*.id, count.index)
  instance_id = aws_instance.ec2.id

  lifecycle {
    ignore_changes = [
      volume_id,
      instance_id,
    ]
  }
}

resource "aws_volume_attachment" "attach_vol5" {
  count       = var.vol5_size != "" ? 1 : 0
  device_name = var.vol5_name
  volume_id   = element(aws_ebs_volume.vol5.*.id, count.index)
  instance_id = aws_instance.ec2.id

  lifecycle {
    ignore_changes = [
      volume_id,
      instance_id,
    ]
  }
}

resource "aws_volume_attachment" "attach_vol6" {
  count       = var.vol6_size != "" ? 1 : 0
  device_name = var.vol6_name
  volume_id   = element(aws_ebs_volume.vol6.*.id, count.index)
  instance_id = aws_instance.ec2.id

  lifecycle {
    ignore_changes = [
      volume_id,
      instance_id,
    ]
  }
}
