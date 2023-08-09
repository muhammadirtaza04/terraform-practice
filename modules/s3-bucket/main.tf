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
  bucket = aws_s3_bucket.my-bucket.bucket
  key    = "user-data.sh"
  content = var.content
  #etag = md5(var.content)
}