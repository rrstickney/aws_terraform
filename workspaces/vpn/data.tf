
data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket         = "tfstate-icestation"
    key            = "vpc/terraform.state"
    region         = "us-west-2"
    dynamodb_table = "tfstate-icestation-dynamo"
  }
}




