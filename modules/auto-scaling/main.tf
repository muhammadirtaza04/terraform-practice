terraform {
  required_version = ">=1.4.6"
}

resource "aws_launch_configuration" "ec2" {
  name_prefix     = var.asg_name
  image_id        = var.image_id
  instance_type   = var.instanse_size
  #user_data       = file("user-data.sh")

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "ec2-private" {
  min_size             = 1
  max_size             = 2
  desired_capacity     = 1
  launch_configuration = aws_launch_configuration.ec2.name
  vpc_zone_identifier  = var.vpc_private_subnets
}

resource "aws_autoscaling_group" "ec2-public" {
  min_size             = 1
  max_size             = 2
  desired_capacity     = 1
  launch_configuration = aws_launch_configuration.ec2.name
  vpc_zone_identifier  = var.vpc_public_subnets
}