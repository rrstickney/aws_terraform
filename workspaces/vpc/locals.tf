locals {
  vpc = {
    "main_vpc" = {
      name               = "main_vpc"
      cidr               = "10.141.0.0/16"
      azs                = ["us-west-2a", "us-west-2b", "us-west-2c"]
      private_subnets    = ["10.141.1.0/24", "10.141.2.0/24", "10.141.3.0/24"]
      public_subnets     = ["10.141.101.0/24", "10.141.102.0/24", "10.141.103.0/24"]
      enable_nat_gateway = true
    }
  }
  tags = {
    managed_by = "terraform"
    service    = "vpc"
  }
}
