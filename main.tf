/*terraform {
  backend "s3" {
    bucket = "terraform-remot-bucket02"
    key = "state/terraform.tfstate"
    region = "us-east-1"
    profile = "default"
  }
}*/

provider "aws" {
  region = "us-east-1"
  profile = "default"
}

module "vpc" {
  source = "./modules/network"
  cidr_block = "10.0.0.0/16"
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  tags_private_subnet = "Private-Subnet"
  public_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
  tags_public_subnet = "Public-Subnet"
}

module "private-server"{
  source = "./modules/ec2"
  instance_ami = "ami-022e1a32d3f742bd8"
  instanse_size = "t2.micro"
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

module "auto-scaling" {
  source = "./modules/auto-scaling" 
  asg_name = "ec2-auto-scaling" 
  image_id = "ami-022e1a32d3f742bd8"
  instanse_size = "t2.micro"
  vpc_private_subnets = module.vpc.private_subnets_id
  tags_private = "Private_Server_ASG"
  vpc_public_subnets = module.vpc.public_subnets_id
  tags_public = "Public_Server_ASG"
}

module "s3-bucket" {
  source = "./modules/s3-bucket"  
  bucket_name = "my-tf-test-bucket"
  tags = "Production_Bucket"
}