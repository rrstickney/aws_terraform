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
