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

#  Creating VPC
resource "aws_vpc" "vpc"{
cidr_block = "10.0.0.0/16"
}

module "webserver" {

source = "./modules/webserver"

vpc_id = aws_vpc.vpc.id

}
