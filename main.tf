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


module "networking" {

source = "./modules/network"
}

module "instance_profile" {
source = "./modules/webserver"

}

module "s3" {
  source = "./modules/bucket"
}