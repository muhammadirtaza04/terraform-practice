terraform {
  backend "s3" {
    bucket = "terraform-remote-bucket02"
    key = "my-state/terraform.tfstate"
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
cidr_block_1 = "10.0.1.0/24"
cidr_block_2 = "10.0.2.0/24"
cidr_block_3 = "10.0.3.0/24"
cidr_block_4 = "10.0.4.0/24"
web-server-name_1 = "Internal-Server-1"
web-server-name_2 = "Internal-Server-2"
web-server-name_3 = "External-Server-1"
web-server-name_4 = "External-Server-2"
env-prefix_1 = "Internal-Subnet-1"
env-prefix_2 = "Internal-Subnet-2"
env-prefix_3 = "External-Subnet-1"
env-prefix_4 = "External-Subnet-2"
ami = "ami-06e46074ae430fba6"
instance_type = "t2.micro"
}
