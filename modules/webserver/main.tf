terraform {

required_version = ">=1.3.9"

}

resource "aws_subnet" "internal-subnet-1"{

vpc_id = var.vpc_id
cidr_block = var.cidr_block_1

tags = {

Name = "${var.env-prefix_1}"
}
}

resource "aws_subnet" "internal-subnet-2"{

vpc_id = var.vpc_id
cidr_block = var.cidr_block_2

tags = {

Name = "${var.env-prefix_2}"
}
}

resource "aws_subnet" "external-subnet-1"{

vpc_id = var.vpc_id
cidr_block = var.cidr_block_3

tags = {

Name = "${var.env-prefix_3}"
}
}

resource "aws_subnet" "external-subnet-2"{

vpc_id = var.vpc_id
cidr_block = var.cidr_block_4

tags = {

Name = "${var.env-prefix_4}"
}
}

resource "aws_instance" "internal-1" {

 ami = var.ami
 instance_type = var.instance_type
 subnet_id = aws_subnet.internal-subnet-1.id

 tags = {
   Name = "${var.web-server-name_1}"
 }
}

resource "aws_instance" "internal-2" {

 ami = var.ami
 instance_type = var.instance_type
 subnet_id = aws_subnet.internal-subnet-2.id

 tags = {
   Name = "${var.web-server-name_2}"
 }
}

resource "aws_instance" "external-1" {

 ami = var.ami
 instance_type = var.instance_type
 subnet_id = aws_subnet.external-subnet-1.id

 tags = {
   Name = "${var.web-server-name_3}"
 }
}

resource "aws_instance" "external-2" {

 ami = var.ami
 instance_type = var.instance_type
 subnet_id = aws_subnet.external-subnet-2.id

 tags = {
   Name = "${var.web-server-name_4}"
 }
}