output "vpc_id" {
 value = aws_vpc.vpc.id
}
output "vpc_private_subnets" {   
 value = { for subnet in aws_subnet.aws_private-subnets : subnet.id => subnet.cidr_block }
}
output "vpc_public_subnets" {    
 value = { for subnet in aws_subnet.aws_public-subnets : subnet.id => subnet.cidr_block }
}

output "private_subnets_id" {   
 value = [for subnet in aws_subnet.aws_private-subnets : subnet.id  ]
}

output "public_subnets_id" {   
 value = [for subnet in aws_subnet.aws_public-subnets : subnet.id  ]
}