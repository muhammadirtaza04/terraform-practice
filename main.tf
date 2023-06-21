terraform {
  backend "s3" {
    bucket = "terraform-remote-bucket02"
    key = "state/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
region = "us-east-1"
}

module "vpc" {
 source = "./modules/network"
 cidr_block = "10.0.0.0/16"
 private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
 public_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
}

module "private-server"{
 source = "./modules/ec2"
 instance_ami = "ami-022e1a32d3f742bd8"
 instanse_size = "t2.micro"
 instance_count = 2
 subnets = keys(module.vpc.vpc_private_subnets)
 tags = "Private-Server"
 sg-id = module.aws-security-group.sg-id
}

module "public-server"{
 source = "./modules/ec2"
 instance_ami = "ami-022e1a32d3f742bd8"
 instanse_size = "t2.micro"
 instance_count = 2
 subnets = keys(module.vpc.vpc_public_subnets)
 tags = "Public-Server"
 sg-id = module.aws-security-group.sg-id
}

module "aws-security-group" {
  source = "./modules/security-group"
  sg_name = "my-app-sg"
  vpc-id = module.vpc.vpc_id
  my-ip = "172.16.32.99/32"
}
