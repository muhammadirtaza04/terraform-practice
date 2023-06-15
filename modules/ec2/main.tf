terraform {

required_version = ">=1.1.9"

}

resource "random_shuffle" "subnets" {

input = var.subnets
result_count = 1
}

# Create EC2 Instance
resource "aws_instance" "ec2_instance" {

  ami           = var.instance_ami
  instance_type = var.instanse_size
  count = 2
  subnet_id = random_shuffle.subnets.result[0]
  associate_public_ip_address = true
  tags = {
    Name = var.tags
  }
}

