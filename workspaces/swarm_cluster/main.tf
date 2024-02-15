# create a keypair for my instances
module "ec2_keys" {
  source   = "./modules/aws/ec2_keys"
  for_each = local.ec2_keys

  key_name   = each.key
  public_key = each.value.public_key
  tags       = merge(local.common_tags, { "Name" = each.key })
}

# create security groups for the instances
module "ec2_security_group" {
  source   = "./modules/aws/ec2_security_group"
  for_each = local.ec2_security_groups

  name        = each.key
  description = each.value.description
  vpc_id      = each.value.vpc_id
  ingress     = each.value.ingress
  egress      = each.value.egress
  tags        = merge(local.common_tags, { "Name" = each.key })
}

#create the instances
module "ec2_instance" {
  source   = "./modules/aws/ec2_instance"
  for_each = local.ec2_instance

  name                   = each.key
  instance_type          = each.value.instance_type
  ami                    = data.aws_ami.ubuntu_22_arm64.id
  monitoring             = each.value.monitoring
  root_block_device      = each.value.root_block_device
  ebs_block_device       = each.value.ebs_block_device
  key_name               = each.value.key_name
  subnet_id              = each.value.subnet_id
  vpc_security_group_ids = each.value.vpc_security_group_ids

  tags        = merge(local.common_tags, { "Name" = each.key })
  volume_tags = merge(local.common_tags, { "host" = each.key })
}

