provider "aws" {
  profile = "icestation"
  region  = "us-west-2"
}
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket         = "tfstate-icestation"
    key            = "iam_roles/terraform.state"
    region         = "us-west-2"
    dynamodb_table = "tfstate-icestation-dynamo"
  }
}
