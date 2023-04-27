terraform {

required_version = ">=1.3.9"

}

locals {
  subnet_ids = {
    for name, subnet in module.networking.var.subnets : name => module.networking.aws_subnet.subnets[name].id
  }
}

resource "aws_instance" "my-instance" {
for_each = var.instance

 ami = each.value["ami"]
 instance_type = each.value["instance_type"]
 tags = each.value["tags"]
 subnet_id = local.subnet_ids[each.value["subnet"]]
}