terraform {
  required_version = ">=1.4.6"
}

# Create EC2 Instance

resource "aws_instance" "ec2_instance" {
  ami           = var.instance_ami
  instance_type = var.instanse_size
  count = var.instance_count
  iam_instance_profile = var.instance_profile
  subnet_id = var.subnet-id[count.index]
  associate_public_ip_address = true
  vpc_security_group_ids = [var.sg-id]
  user_data = <<EOF
		#! /bin/bash
        sudo apt-get update
		    sudo apt install jq
	EOF

  tags = {
    Name = var.tags
  }
}