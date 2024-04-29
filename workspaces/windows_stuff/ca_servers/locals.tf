locals {
  common_tags = {
    created_by = "terraform"
    service    = "windows_ca"
  }
  root_block_device = [
    {
      volume_size           = "80"
      volume_type           = "gp2"
      encrypted             = true
      delete_on_termination = true
    }
  ]
  ebs_block_device = [
    {
      device_name           = "/dev/xvda"
      volume_size           = "200"
      volume_type           = "gp2"
      encrypted             = true
      delete_on_termination = true
    }
  ]
  private_subnet_ids = data.terraform_remote_state.vpc.outputs.vpc_output.main_vpc.vpc_output.private_subnets

  ec2_instance = {
    "offline_root" = {
      instance_type = "t2.medium"
      role          = "offline_root"
      key_name      = data.terraform_remote_state.domain_controllers.outputs.key_pair_output.windows_keypair.key_pair_output
      monitoring    = false
      subnet_id     = data.aws_subnet.private_subnet_2a.id
      vpc_security_group_ids = [
        data.terraform_remote_state.domain_controllers.outputs.security_group_output.windows_domain_controllers.security_group_output.id,
      ]
    }
    "online_intermediate" = {
      instance_type = "t2.large"
      role          = "intermediate"
      key_name      = data.terraform_remote_state.domain_controllers.outputs.key_pair_output.windows_keypair.key_pair_output
      monitoring    = false
      subnet_id     = data.aws_subnet.private_subnet_2b.id
      vpc_security_group_ids = [
        data.terraform_remote_state.domain_controllers.outputs.security_group_output.windows_domain_controllers.security_group_output.id
      ]

    }
  }
}

