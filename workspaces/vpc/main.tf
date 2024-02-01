module "vpc" {
  source   = "./modules/aws/vpc"
  for_each = local.vpc

  vpc_name               = each.value.name
  vpc_cidr               = each.value.cidr
  vpc_azs                = each.value.azs
  vpc_private_subnets    = each.value.private_subnets
  vpc_public_subnets     = each.value.public_subnets
  vpc_enable_nat_gateway = each.value.enable_nat_gateway
}
