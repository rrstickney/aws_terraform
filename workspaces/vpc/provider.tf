provider "aws" {
  region = "us-west-2"
}
terraform {
  cloud {
    hostname     = "app.terraform.io"
    organization = "icestation-is"
    workspaces {
      tags = ["vpc"]
    }
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  # backend "s3" {
  #   bucket         = "tfstate-icestation"
  #   key            = "vpc/terraform.state"
  #   region         = "us-west-2"
  #   dynamodb_table = "tfstate-icestation-dynamo"
  # }
}
