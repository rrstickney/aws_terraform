module "ec2_keys" {
  source   = "./modules/aws/ec2_keys"
  for_each = local.ec2_keys

  key_name   = each.value.key_name
  public_key = each.value.public_key
  tags       = local.common_tags
}

