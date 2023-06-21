variable "cidr_block" {}
variable "private_subnets" {
 type = list(string)
}

variable "public_subnets" {
 type = list(string)
}