# outputs file

output "key_pair_output" {
  value = module.ec2_keys
}

output "security_group_output" {
  value = module.ec2_security_group
}
