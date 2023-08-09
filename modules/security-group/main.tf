terraform {
  required_version = ">=1.4.6"
}

resource "aws_security_group" "my-sg" {
  name = var.sg_name
  vpc_id = var.vpc-id

  ingress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = [var.my-ip]
  }
  # ingress {
  #  from_port = 8080
  #  to_port = 8080
  #  protocol = "tcp"
  #  cidr_blocks = [var.my-ip]
  # }
  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
  }
}
