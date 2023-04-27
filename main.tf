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

module "webserver" {

source = "./modules/webserver"

}
