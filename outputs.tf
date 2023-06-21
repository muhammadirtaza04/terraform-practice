output "created_resources" {
  value = [   
   module.vpc.vpc_private_subnets,
   module.vpc.vpc_public_subnets,
  ]
}