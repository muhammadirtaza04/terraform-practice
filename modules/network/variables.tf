variable "cidr_block" {}
variable "private_subnets" {
 type = list(string)
}

variable "public_subnets" {
 type = list(string)
}
variable "tags_private_subnet" {}
variable "tags_public_subnet" {}