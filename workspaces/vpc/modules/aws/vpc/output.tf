output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets_id" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "private_subnets_id" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}
