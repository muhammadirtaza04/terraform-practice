terraform {

required_version = ">=1.3.9"

}

resource "aws_s3_bucket" "my-bucket" {
  bucket = "my-s3-bucket"

  tags = {
    Name = "My-bucket"
    Environment = "DEV"
  }
}