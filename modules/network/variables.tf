variable "cidr_block" {}
variable "vpc_name" {}
variable "private_subnet_az" {
type = list(string)
}
variable "public_subnet_az" {
    type = list(string)
}
variable "private_subnets" {
 type = list(string)
}

variable "public_subnets" {
 type = list(string)
}
variable "tags_private_subnet" {}
variable "tags_public_subnet" {}
variable "tags_private_route_table" {}
variable "tags_public_route_table" {}
variable "igw" {}
variable "nat_gateway_type" {}
variable "nat_gatway_public_subnet_1_id" {}
variable "nat_gatway_public_subnet_2_id" {}
