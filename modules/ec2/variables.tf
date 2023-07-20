variable "instance_ami"{
    type = string
}
variable "instanse_size"{
    type = string
}

variable "tags"{
    type = string
    default = null
}
variable "sg-id" {}
variable "instance_count" {}

variable "subnet-id" { 

}
variable "instance_profile" {
  type = string
  default = null
}
variable "user_data" {
  
}