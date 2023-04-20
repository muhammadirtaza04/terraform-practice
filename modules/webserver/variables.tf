variable "vpc_id" {
    type = string
    description = "VPC ID"
}

variable "cidr_block_1" {
    type = string
    description = "Subnet CIDR Block"
}

variable "cidr_block_2" {
    type = string
    description = "Subnet CIDR Block"
}

variable "cidr_block_3" {
    type = string
    description = "Subnet CIDR Block"
}

variable "cidr_block_4" {
    type = string
    description = "Subnet CIDR Block"
}

variable "env-prefix_1" {
    type = string
    description = "Environment"
}

variable "env-prefix_2" {
    type = string
    description = "Environment"
}

variable "env-prefix_3" {
    type = string
    description = "Environment"
}

variable "env-prefix_4" {
    type = string
    description = "Environment"
}
variable "web-server-name_1" {
  type = string
  description = "Name of the webserver"
}

variable "web-server-name_2" {
  type = string
  description = "Name of the webserver"
}

variable "web-server-name_3" {
  type = string
  description = "Name of the webserver"
}

variable "web-server-name_4" {
  type = string
  description = "Name of the webserver"
}

variable "ami" {
type = string
description = "AMI ID"
}

variable "instance_type" {
  type = string
  description = "Instance type"
}