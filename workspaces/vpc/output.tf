output "vpc_id" {
  value = module.vpc
}

output "public_subnets_id" {
  description = "List of IDs of public subnets"
  value       = module.vpc
}

output "private_subnets_id" {
  description = "List of IDs of private subnets"
  value       = module.vpc
}
