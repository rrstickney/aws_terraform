module "ca_servers" {
  source   = "./modules/aws/ec2_instance"
  for_each = local.ec2_instance

  name                   = each.key
  instance_type          = each.value.instance_type
  ami                    = data.aws_ami.windows_server_2019.id
  monitoring             = each.value.monitoring
  root_block_device      = local.root_block_device
  ebs_block_device       = local.ebs_block_device
  key_name               = each.value.key_name
  subnet_id              = each.value.subnet_id
  vpc_security_group_ids = each.value.vpc_security_group_ids


  tags        = merge(local.common_tags, { "Name" = each.key })
  volume_tags = merge(local.common_tags, { "host" = each.key })
}
