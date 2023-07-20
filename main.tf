terraform {
  backend "s3" {
    bucket = "me-tf-test-bucket"
    key = "state/terraform.tfstate"
    region = "us-east-1"
    profile = "AWSAdministratorAccess-700371968868"

  }
}

provider "aws" {
  region = "us-east-1"
  profile = "AWSAdministratorAccess-700371968868"
}

module "vpc" {
  source = "./modules/network"

  cidr_block = "20.0.0.0/16"
  vpc_name = "My-Custom-VPC"
  private_subnet_az = ["us-east-1a","us-east-1b"]
  private_subnets = ["20.0.1.0/24", "20.0.2.0/24"]
  tags_private_subnet = "Private-Subnet"
  tags_private_route_table = "Private-RTB"
  public_subnet_az = ["us-east-1a","us-east-1b"]
  public_subnets = ["20.0.3.0/24", "20.0.4.0/24"]
  tags_public_route_table = "Public-RTB"
  tags_public_subnet = "Public-Subnet"
  igw = "IGW"
  nat_gateway_type = "public"
  nat_gatway_public_subnet_1_id = module.vpc.public_subnets_id[0]
  nat_gatway_public_subnet_2_id = module.vpc.public_subnets_id[1]
}

module "private-server"{
  source = "./modules/ec2"
  instance_ami = "ami-022e1a32d3f742bd8"
  instanse_size = "t2.micro"
  instance_profile = module.iam-role-policy.instance_profile
  instance_count = 2
  subnet-id = module.vpc.private_subnets_id
  tags = "Private-Server"
  sg-id = module.aws-security-group.sgrp-id
}

module "public-server"{
  source = "./modules/ec2"
  instance_ami = "ami-022e1a32d3f742bd8"
  instanse_size = "t2.micro"
  instance_count = 2
  subnet-id = module.vpc.public_subnets_id
  tags = "Public-Server"
  sg-id = module.aws-security-group.sgrp-id
}

module "aws-security-group" {
  source = "./modules/security-group"
  sg_name = "my-app-sg"
  vpc-id = module.vpc.vpc_id
  my-ip = "172.16.32.99/32"
}

module "auto-scaling-1" {
  source = "./modules/auto-scaling" 
  asg_name = "ec2-auto-scaling" 
  image_id = "ami-022e1a32d3f742bd8"
  instanse_size = "t2.micro"
  min_size = 1
  max_size =2
  capacity = 1
  vpc_private_subnets = module.vpc.private_subnets_id
  tags_private = "Private_Server_ASG"
  vpc_public_subnets = module.vpc.public_subnets_id
  tags_public = "Public_Server_ASG"
}

module "s3-bucket" {
  source = "./modules/s3-bucket"  
  bucket_name = "me-tf-test-bucket2"
  tags = "Production_Bucket"
}

module "iam-role-policy"{
    source = "./modules/IAM"
    policy_name = "MY_Custom_Policy"  
    iam_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:*",
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
  role_name = "MY_EC2_ROLE"
  role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "testrole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

//module "auto-scaling-2"

//- use for_each inside module.

