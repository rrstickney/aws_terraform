provider "aws" {
  region = "us-west-2"
}

provider "digitalocean" {
  token = var.do_token
}
variable "do_token" {
  description = "API token for DigitalOcean provider"
  type        = string
  sensitive   = true
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
  backend "s3" {
    bucket         = "tfstate-icestation"
    key            = "icestation_is_records/terraform.state"
    region         = "us-west-2"
    dynamodb_table = "tfstate-icestation-dynamo"
  }
}
