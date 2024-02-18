resource "aws_instance" "this" {
  #name                   = var.name
  instance_type               = var.instance_type
  ami                         = var.ami
  key_name                    = var.key_name
  monitoring                  = var.monitoring
  vpc_security_group_ids      = var.vpc_security_group_ids
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.associate_public_ip_address
  dynamic "root_block_device" {
    for_each = var.root_block_device
    content {
      volume_size           = root_block_device.value.volume_size
      volume_type           = root_block_device.value.volume_type
      encrypted             = root_block_device.value.encrypted
      delete_on_termination = root_block_device.value.delete_on_termination
    }
  }
  dynamic "ebs_block_device" {
    for_each = var.ebs_block_device
    content {
      device_name           = ebs_block_device.value.device_name
      volume_size           = ebs_block_device.value.volume_size
      volume_type           = ebs_block_device.value.volume_type
      encrypted             = ebs_block_device.value.encrypted
      delete_on_termination = ebs_block_device.value.delete_on_termination
    }
  }
  tags        = var.tags
  volume_tags = var.volume_tags
}
