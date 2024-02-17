module "vpc" {
  source   = "./modules/aws/vpc"
  for_each = local.vpc

  vpc_name            = each.key
  vpc_cidr            = each.value.cidr
  vpc_azs             = each.value.azs
  vpc_private_subnets = each.value.private_subnets
  vpc_public_subnets = each.value.public_subnets

  tags                    = merge(local.tags, { "Name" = each.key })
  vpc_private_subnet_tags = merge(local.tags, { "Name" = "private_subnet" })
  vpc_public_subnet_tags  = merge(local.tags, { "Name" = "public_subnet" })
}
