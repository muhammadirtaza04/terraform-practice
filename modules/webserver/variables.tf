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

variable "instance"{
type = map(object({
ami = string
instance_type = string
subnet = string
tags = map(string)
}))

default = {
  "one" = {
    ami = "ami-06e46074ae430fba6"
    instance_type = "t2.micro"
    subnet = "one"
    tags = {

      "Name" = "Internal-Server-1"
    }
  }
  "two" = {
    ami = "ami-06e46074ae430fba6"
    instance_type = "t2.micro"
    subnet = "two"
    tags = {

      "Name" = "Internal-Server-2"
    }
  }
    "three" = {
    ami = "ami-06e46074ae430fba6"
    instance_type = "t2.micro"
    subnet = "three"
    tags = {

      "Name" = "External-Server-1"
    }
  }
    "four" = {
    ami = "ami-06e46074ae430fba6"
    instance_type = "t2.micro"
    subnet = "four"
    tags = {

      "Name" = "External-Server-2"
    }
  }
}
}