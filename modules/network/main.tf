terraform {
  required_version = ">=1.4.6"
}

#  Creating a VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
}

# Create Private Subnets
resource "aws_subnet" "aws_private-subnets" {
  vpc_id = aws_vpc.vpc.id
  for_each = toset(var.private_subnets)
  cidr_block = each.value
  tags = {
    Name = var.tags_private_subnet
  }
}

# Create Public Subnets
resource "aws_subnet" "aws_public-subnets" {
  vpc_id = aws_vpc.vpc.id
  for_each = toset(var.public_subnets)
  cidr_block = each.value
  tags = {
    Name = var.tags_public_subnet
  }  
}