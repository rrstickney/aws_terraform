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

#create the manager instances
module "swarm_manager" {
  source   = "./modules/aws/ec2_instance"
  for_each = local.ec2_instance

  name                        = each.key
  instance_type               = each.value.instance_type
  ami                         = data.aws_ami.ubuntu_22_arm64.id
  monitoring                  = each.value.monitoring
  root_block_device           = local.root_block_device
  ebs_block_device            = local.ebs_block_device
  key_name                    = each.value.key_name
  subnet_id                   = each.value.subnet_id
  vpc_security_group_ids      = each.value.vpc_security_group_ids
  associate_public_ip_address = each.value.associate_public_ip_address

  tags        = merge(local.common_tags, { "Name" = each.key }, { "role" = "manager" })
  volume_tags = merge(local.common_tags, { "host" = each.key })
}

#create the worker instances
module "swarm_worker" {
  source = "./modules/aws/ec2_instance"
  count  = 2

  name                        = "swarm-worker-0${count.index + 1}"
  instance_type               = "a1.xlarge"
  ami                         = data.aws_ami.ubuntu_22_arm64.id
  monitoring                  = false
  root_block_device           = local.root_block_device
  ebs_block_device            = local.ebs_block_device
  key_name                    = module.ec2_keys["dev_pi_cluster"].key_pair_output
  subnet_id                   = local.a1_xlarge_subnet_ids[count.index % length(local.a1_xlarge_subnet_ids)]
  vpc_security_group_ids      = [module.ec2_security_group["dev_pi_cluster_internal"].security_group_output.id]
  associate_public_ip_address = false

  tags        = merge(local.common_tags, { "Name" = "swarm-worker-0${count.index + 1}" }, { "role" = "worker" })
  volume_tags = merge(local.common_tags, { "host" = "swarm-worker-0${count.index + 1}" })
}

