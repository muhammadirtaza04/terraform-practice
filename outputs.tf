output "network_resources" {
  value = [   
   module.vpc.private_subnets_cidr_block,
   module.vpc.public_subnets_cidr_block,
   module.vpc.vpc_id,
   module.vpc.private_subnets_id,
   module.vpc.public_subnets_id,
  ]
}

/*output "bucket_name" {
  value = module.s3-bucket.bucket_name
}*/
