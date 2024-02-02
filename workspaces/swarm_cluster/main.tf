# create a keypair for my instances
module "ec2_keys" {
  source   = "./modules/aws/ec2_keys"
  for_each = local.ec2_keys

  key_name   = each.value.key_name
  public_key = each.value.public_key
  tags       = local.common_tags
}

# create security groups for the cluster to talk to itself and for external ips to talk to the swarm managers

module "ec2_security_group" {
  source   = "./modules/aws/ec2_security_group"
  for_each = local.ec2_security_groups

  name        = each.key
  description = each.value.description
  vpc_id      = data.vpc.vpc_id
  ingress     = each.value.ingress
  egress      = each.value.egress
  tags        = local.common_tags
}


