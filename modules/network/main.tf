terraform {
  required_version = ">=1.4.6"
}

#  Creating a VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = var.vpc_name
  }
}

# Create Private Subnets
resource "aws_subnet" "aws_private-subnets" {
  vpc_id = aws_vpc.vpc.id
  for_each = { for i, subnet in var.private_subnets : i => subnet }
  cidr_block = each.value
  availability_zone = var.private_subnet_az[each.key]
  tags = {
    Name = "${var.tags_private_subnet} - ${each.key+1}"
  }
}

# Create Private Route Table
resource "aws_route_table" "private_rtb" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gtw_pub_1.id
  }
  tags = {
    Name = var.tags_private_route_table
  }
}

resource "aws_route_table_association" "private_subnets" {
 # for_each = toset([for subnet in aws_subnet.aws_private-subnets : subnet.id  ])
  
  for_each = { for idx, subnet in aws_subnet.aws_private-subnets : idx => subnet }

  subnet_id      = each.value.id
  route_table_id = aws_route_table.private_rtb.id
}

# Create Public Subnets
resource "aws_subnet" "aws_public-subnets" {
  vpc_id = aws_vpc.vpc.id
  for_each = { for i, subnet in var.public_subnets : i => subnet }
  cidr_block = each.value
  availability_zone = var.public_subnet_az[each.key]
  tags = {
    Name = "${var.tags_public_subnet} - ${each.key+1}"
  }  
}

# Create Public Route Table
resource "aws_route_table" "public_rtb" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = var.tags_public_route_table
  }
}

resource "aws_route_table_association" "public_subnets" {
  for_each = { for idx, subnet in aws_subnet.aws_public-subnets : idx => subnet }
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_rtb.id
}

# Creating Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.igw
  }
}

resource "aws_eip" "my_eip" {
  vpc = true
}

# Creating NAT Gateway For Public Subnet 1
resource "aws_nat_gateway" "nat_gtw_pub_1" {
  connectivity_type = var.nat_gateway_type
  subnet_id         = var.nat_gatway_public_subnet_1_id
  allocation_id = aws_eip.my_eip.id
}
