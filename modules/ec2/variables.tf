variable "instance_ami"{
    type = string
}

variable "instanse_size"{
    type = string
}

variable "subnets"{
    type = list(string)
}

variable "tags"{
    type = string
    default = null
}
