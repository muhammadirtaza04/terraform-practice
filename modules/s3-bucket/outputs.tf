output "bucket_name" {
  value = aws_s3_bucket.my-bucket.bucket
}

output "user_data" {
  value = aws_s3_object.object.content
}