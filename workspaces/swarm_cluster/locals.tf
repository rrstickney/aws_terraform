locals {
  common_tags = {
    created_by = "terraform"
    service    = "pi_swarm"
  }
  ec2_keys = {
    "dev_pi_cluster" = {
      key_name   = "dev_pi_cluster_keypair"
      public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDmJV/ot9poQctPRxuE0vv0gitSjrraovLXP9tM1zV6KJe1B6vjsDOPuBkM5H41rv0rTPPVDNSlUMcrmVGXnP4j1PPkv7V2Ro3Gnt4ZKp4wf40dkyLlvaZajVYGErP4J3LoAY4dkUPIeGp3REjciKr+5QQ0MZ3Re88DC6k4pGw+XnlMtD2K/V2yjZg5358LuqAQtvWwrQJyWx3Goh1jbHMwFYUI+sNqEdH9CHFHAx5XiGIEde/yTC8h5QLqCexDkmeNNQqoPJD1GQEsQksrQlJ0qEHan9tl8MNqabimqkRJtF4pZ9fNsmBRpFO56Fvt/LFO+Dm0hHK7gS/LA49+iWveWiW/5VHMDElfVZTA4PwgMqhH3MNpdgQT3pQeIuEmrjulJBJ+EQPb94F72qVe7Q2ujEqT0PwaA/3kIs883szw7tRkI5hG0eGDGOkTMZsT3vu4N9GQOh0n5Zy/vUS0RYhdFiv4fYbAvj8354CFxp5/pO77dSEql+E4nEQO2iY85/8="
    }
  }
  ec2_security_groups = {
    "dev_pi_cluster_internal" = {
      description = "SG for internal network traffic between cluster members"
      vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id.main_vpc.vpc
      ingress = [
        {
          description = "secure docker client comms"
          from_port   = 2376
          to_port     = 2377
          protocol    = "tcp"
          self        = true
        },
        {
          description = "container network discovery tcp"
          from_port   = 7946
          to_port     = 7946
          protocol    = "tcp"
          self        = true
        },
        {
          description = "container network discovery udp"
          from_port   = 7946
          to_port     = 7946
          protocol    = "udp"
          self        = true
        },
        {
          description = "overlay network"
          from_port   = 4789
          to_port     = 4789
          protocol    = "udp"
          self        = true
        }
      ]
      egress = [
        {
          description = "Allow all outbound traffic"
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = "0.0.0.0/0"
        }
      ]
    }
    "dev_pi_cluster_admin_access_external" = {
      description = "SG for external access to manage the pis"
      # this SG should be replaced with something that uses teleport
      vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id.main_vpc.vpc
      ingress = [
        {
          description = "ssh to the hosts"
          from_port   = 22
          to_port     = 22
          protocol    = "tcp"
          cidr_blocks = "73.97.167.56/32"
          self        = false
        }
      ]
      egress = [
        {
          description = "Allow all outbound traffic"
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = "0.0.0.0/0"
        }
      ]
    }
  }
  ec2_instance = {
    "swarm-queen" = {
      instance_type = "a1.xlarge"
      role          = "manager"
      root_block_device = [
        {
          volume_size           = "20"
          volume_type           = "gp2"
          encrypted             = true
          delete_on_termination = true
        }
      ]
      #GlusterFS drive
      ebs_block_device = [
        {
          device_name           = "/dev/xvda"
          volume_size           = "50"
          volume_type           = "gp2"
          encrypted             = true
          delete_on_termination = true
        }
      ]
      key_name   = module.ec2_keys["dev_pi_cluster"].key_pair_output
      monitoring = false
      vpc_security_group_ids = [
        module.ec2_security_group["dev_pi_cluster_internal"].security_group_output.id,
        module.ec2_security_group["dev_pi_cluster_admin_access_external"].security_group_output.id
      ]
      # need to fix vpc tagging and outputs so I can get the subnet value from the state
      subnet_id = ""
    }
    "swarm-worker-001" = {
      instance_type = "a1.xlarge"
      role          = "worker"
      root_block_device = [
        {
          volume_size           = "20"
          volume_type           = "gp2"
          encrypted             = true
          delete_on_termination = true
        }
      ]
      #GlusterFS drive
      ebs_block_device = [
        {
          device_name           = "/dev/xvda"
          volume_size           = "50"
          volume_type           = "gp2"
          encrypted             = true
          delete_on_termination = true
        }
      ]
      key_name   = module.ec2_keys["dev_pi_cluster"].key_pair_output
      monitoring = false
      vpc_security_group_ids = [
        module.ec2_security_group["dev_pi_cluster_internal"].security_group_output.id
      ]
      # need to fix vpc tagging and outputs so I can get the subnet value from the state
      subnet_id = ""
    }
    "swarm-worker-002" = {
      instance_type = "a1.xlarge"
      role          = "worker"
      root_block_device = [
        {
          volume_size           = "20"
          volume_type           = "gp2"
          encrypted             = true
          delete_on_termination = true
        }
      ]
      #GlusterFS drive
      ebs_block_device = [
        {
          device_name           = "/dev/xvda"
          volume_size           = "50"
          volume_type           = "gp2"
          encrypted             = true
          delete_on_termination = true
        }
      ]
      key_name   = module.ec2_keys["dev_pi_cluster"].key_pair_output
      monitoring = false
      vpc_security_group_ids = [
        module.ec2_security_group["dev_pi_cluster_internal"].security_group_output.id
      ]
      # need to fix vpc tagging and outputs so I can get the subnet value from the state
      subnet_id = ""
    }
  }

}
