output "network_resources" {
  value = [   
   module.vpc.vpc_private_subnets,
   module.vpc.vpc_public_subnets,
   module.vpc.vpc_id,
  ]
}

output "bucket_name" {
  value = module.s3-bucket.bucket_name
}
