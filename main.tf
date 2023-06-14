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