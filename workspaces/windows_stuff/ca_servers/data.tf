# for future use, commenting out since it is necessary for current needs# get my external IP address for adding to ingress rules in SGs
# data "http" "my_ip" {
#   url = "http://icanhazip.com"
# }

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket         = "tfstate-icestation"
    key            = "vpc/terraform.state"
    region         = "us-west-2"
    dynamodb_table = "tfstate-icestation-dynamo"
  }
}

data "aws_subnet" "private_subnet_2a" {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_output.main_vpc.vpc_output.vpc_id
  filter {
    name   = "tag:Name"
    values = ["private_subnet"]
  }
  filter {
    name   = "availability-zone"
    values = ["us-west-2a"]
  }
}

data "aws_subnet" "private_subnet_2b" {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_output.main_vpc.vpc_output.vpc_id

  filter {
    name   = "tag:Name"
    values = ["private_subnet"]
  }
  filter {
    name   = "availability-zone"
    values = ["us-west-2b"]
  }
}

data "aws_subnet" "private_subnet_2c" {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_output.main_vpc.vpc_output.vpc_id

  filter {
    name   = "tag:Name"
    values = ["private_subnet"]
  }
  filter {
    name   = "availability-zone"
    values = ["us-west-2c"]
  }
}
data "terraform_remote_state" "domain_controllers" {
  backend = "s3"

  config = {
    bucket         = "tfstate-icestation"
    key            = "windows_dcs/terraform.state"
    region         = "us-west-2"
    dynamodb_table = "tfstate-icestation-dynamo"
  }
}

data "aws_ami" "windows_server_2019" {
  most_recent = true

  filter {
    name   = "name"
    values = ["Windows_Server-2019-English-Full-Base-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}



