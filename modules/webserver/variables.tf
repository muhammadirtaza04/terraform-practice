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