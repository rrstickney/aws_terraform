resource "aws_s3_bucket" "tfstate-icestation" {
  bucket = "tfstate-icestation"

  lifecycle {
    prevent_destroy = true
  }
  tags = local.tags
}

resource "aws_s3_bucket_versioning" "tfstate-icestation" {
  bucket = aws_s3_bucket.tfstate-icestation.id

  versioning_configuration {
    status = "Enabled"
  }
}
