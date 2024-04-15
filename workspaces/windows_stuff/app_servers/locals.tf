locals {
  common_tags = {
    created_by = "terraform"
    service    = "windows_doamin"
  }
  ec2_keys = {
    "windows_domain" = {
      key_name   = "windows_domain_keypair"
      public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDmJV/ot9poQctPRxuE0vv0gitSjrraovLXP9tM1zV6KJe1B6vjsDOPuBkM5H41rv0rTPPVDNSlUMcrmVGXnP4j1PPkv7V2Ro3Gnt4ZKp4wf40dkyLlvaZajVYGErP4J3LoAY4dkUPIeGp3REjciKr+5QQ0MZ3Re88DC6k4pGw+XnlMtD2K/V2yjZg5358LuqAQtvWwrQJyWx3Goh1jbHMwFYUI+sNqEdH9CHFHAx5XiGIEde/yTC8h5QLqCexDkmeNNQqoPJD1GQEsQksrQlJ0qEHan9tl8MNqabimqkRJtF4pZ9fNsmBRpFO56Fvt/LFO+Dm0hHK7gS/LA49+iWveWiW/5VHMDElfVZTA4PwgMqhH3MNpdgQT3pQeIuEmrjulJBJ+EQPb94F72qVe7Q2ujEqT0PwaA/3kIs883szw7tRkI5hG0eGDGOkTMZsT3vu4N9GQOh0n5Zy/vUS0RYhdFiv4fYbAvj8354CFxp5/pO77dSEql+E4nEQO2iY85/8="
    }
  }
  ec2_security_groups = {
    "windows_domain_controllers" = {
      description = "SG for dcs to talk to dcs"
      vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_output.main_vpc.vpc_output.vpc_id
      ingress = [
        {
          description = "ldap tcp"
          from_port   = 389
          to_port     = 389
          protocol    = "tcp"
          self        = true
        },
        {
          description = "ldap udp"
          from_port   = 389
          to_port     = 389
          protocol    = "udp"
          self        = true
        },
        {
          description = "ldap ssl tcp"
          from_port   = 636
          to_port     = 636
          protocol    = "tcp"
          self        = true
        },
        {
          description = "ldap gc"
          from_port   = 3268
          to_port     = 3269
          protocol    = "tcp"
          self        = true
        },
        {
          description = "kerberos tcp"
          from_port   = 88
          to_port     = 88
          protocol    = "tcp"
          self        = true
        },
        {
          description = "kerberos udp"
          from_port   = 88
          to_port     = 88
          protocol    = "udp"
          self        = true
        },
        {
          description = "dns tcp"
          from_port   = 53
          to_port     = 53
          protocol    = "tcp"
          self        = true
        },
        {
          description = "dns udp"
          from_port   = 53
          to_port     = 53
          protocol    = "udp"
          self        = true
        },
        {
          description = "AD Replication TCP"
          from_port   = 445
          to_port     = 445
          protocol    = "tcp"
          self        = true
        },
        {
          description = "AD Replication UDP"
          from_port   = 445
          to_port     = 445
          protocol    = "udp"
          self        = true
        },
        {
          description = "file replication tcp"
          from_port   = 5722
          to_port     = 5722
          protocol    = "tcp"
          self        = true
        },
        {
          description = "windows time"
          from_port   = 123
          to_port     = 123
          protocol    = "udp"
          self        = true
        },
        {
          description = "Kerberos passwords udp"
          from_port   = 464
          to_port     = 464
          protocol    = "udp"
          self        = true
        },
        {
          description = "Kerberos passwords tcp"
          from_port   = 464
          to_port     = 464
          protocol    = "tcp"
          self        = true
        },
        {
          description = "DFS, GPO"
          from_port   = 137
          to_port     = 138
          protocol    = "udp"
          self        = true
        },
        {
          description = "User and computer Authentication, Replication"
          from_port   = 139
          to_port     = 139
          protocol    = "tcp"
          self        = true
        },

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
  a1_xlarge_subnet_ids = [
    data.aws_subnet.public_subnet_2a.id,
    data.aws_subnet.public_subnet_2c.id
  ]
}
