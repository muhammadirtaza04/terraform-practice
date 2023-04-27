terraform {

required_version = ">=1.3.9"

}

#  Creating VPC
resource "aws_vpc" "vpc"{
cidr_block = var.cidr_block
}

resource "aws_subnet" "subnets"{
vpc_id = aws_vpc.vpc

for_each = var.subnets

cidr_block = each.value["cidr"]
tags = each.value["tags"]
}
