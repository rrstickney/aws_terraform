resource "aws_dynamodb_table" "tfstate-icestation-dynamo" {
  name           = "tfstate-icestation-dynamo"
  hash_key       = "LockID"
  read_capacity  = 5
  write_capacity = 5

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = local.tags
}
