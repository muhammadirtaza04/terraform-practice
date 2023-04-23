terraform {

required_version = ">=1.3.9"

}

resource "aws_subnet" "subnets"{
vpc_id = var.vpc_id

for_each = var.subnets

cidr_block = each.value["cidr"]
tags = each.value["tags"]
}

locals {
  subnet_ids = {
    for name, subnet in var.subnets : name => aws_subnet.subnets[name].id
  }
}

resource "aws_instance" "my-instance" {
for_each = var.instance

 ami = each.value["ami"]
 instance_type = each.value["instance_type"]
 tags = each.value["tags"]
 subnet_id = local.subnet_ids[each.value["subnet"]]
}