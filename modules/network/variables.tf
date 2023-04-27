variable "cidr_block" {
    type = string
    default = "10.0.0.0/16"
}

variable "subnets" {
type = map(object({

cidr = string
tags = map(string)


}))

default = {
  "one" = {
    cidr = "10.0.1.0/24"
    tags = {
     "Name" = "Internal-Subnet-1"
    }

  }

 "two" = {
    cidr = "10.0.2.0/24"
    tags = {
     "Name" = "Internal-Subnet-2"
    }

  }

 "three" = {
    cidr = "10.0.3.0/24"
    tags = {
     "Name" = "External-Subnet-1"
    }

  }

 "four" = {
    cidr = "10.0.4.0/24"
    tags = {
     "Name" = "External-Subnet-2"
    }

  }
}
}