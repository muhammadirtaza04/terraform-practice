terraform {
  required_version = ">=1.4.6"
}

resource "aws_s3_bucket" "my-bucket" {
  bucket = var.bucket_name
  tags = {
    Name   = var.tags
  }
}

resource "aws_s3_object" "object" {
  bucket = var.bucket_name
  key    = "user-data.sh"
  source = "path/to/file"
  etag = filemd5("user-data.sh")
}