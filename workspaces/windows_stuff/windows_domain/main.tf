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

#create the domain controller instances
module "domain_controllers" {
  source = "./modules/aws/ec2_instance"
  count  = 2

  name                        = "usw2-icestationdc-10${count.index + 1}"
  instance_type               = "t3.xlarge"
  ami                         = data.aws_ami.windows_server_2019.id
  monitoring                  = false
  root_block_device           = local.root_block_device
  ebs_block_device            = local.ebs_block_device
  key_name                    = module.ec2_keys["windows_keypair"].key_pair_output
  subnet_id                   = local.a1_xlarge_subnet_ids[count.index % length(local.a1_xlarge_subnet_ids)]
  vpc_security_group_ids      = [module.ec2_security_group["windows_domain_controllers"].security_group_output.id]
  associate_public_ip_address = false

  tags        = merge(local.common_tags, { "Name" = "usw2-isdc-10${count.index + 1}" }, { "role" = "domain_controller" })
  volume_tags = merge(local.common_tags, { "host" = "usw2-isdc-10${count.index + 1}" })
}
