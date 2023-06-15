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
  subnets = keys(module.vpc.vpc_private_subnets)
  tags = "Private-Server"
}

module "public-server"{
  source = "./modules/ec2"
  instance_ami = "ami-022e1a32d3f742bd8"
  instanse_size = "t2.micro"
  subnets = keys(module.vpc.vpc_public_subnets)
  tags = "Public-Server"
}

output "created_resources" {
  value = [
   
   module.vpc.vpc_private_subnets,
   module.vpc.vpc_public_subnets,

  ]
}
