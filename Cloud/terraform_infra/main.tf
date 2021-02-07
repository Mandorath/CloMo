terraform {
  required_version = ">= 0.13"
}

provider "aws" {
  region = var.aws_region
  assume_role {
    role_arn = var.delegation_role
  }
}

resource "aws_vpc" "rp_vpc_01" {
  cidr_block                       = var.vpc_cidr
  assign_generated_ipv6_cidr_block = true
}

resource "aws_subnet" "rp_subnet_01" {
  vpc_id            = aws_vpc.rp_vpc_01.id
  cidr_block        = var.vpc_cidr
  ipv6_cidr_block   = var.vpc_cidr_ipv6
  availability_zone = var.subnet_availability_zone

  tags = {
    Name = "rp-subnet"
  }
}

resource "aws_internet_gateway" "rp_gw_01" {
  vpc_id = aws_vpc.rp_vpc_01.id

  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "rp_rtable_01" {
  vpc_id = aws_vpc.rp_vpc_01.id

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.rp_gw_01.id
  }

  tags = {
    Name = "main"
  }
}


resource "aws_security_group" "rp_sg_01" {
  name        = "allow_rp"
  description = "Allow RP ports inbound traffic"
  vpc_id      = aws_vpc.rp_vpc_01.id

  ingress {
    description      = "HTTP ingress (needed for package installation)"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    ipv6_cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description      = "HTTP egress (needed for package installation)"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    ipv6_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTPS ingress (needed for package installation)"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    ipv6_cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description      = "HTTPS egress (needed for package installation)"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    ipv6_cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    description      = "HTTP ingress"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    description      = "HTTP egress"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    description      = "TLS to VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "SSH to VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "Saltstack to VPC"
    from_port        = 4505
    to_port          = 4505
    protocol         = "tcp"
    ipv6_cidr_blocks = var.lab_env_ipv6_block
  }

  egress {
    description      = "Saltstack from VPC"
    from_port        = 4505
    to_port          = 4505
    protocol         = "tcp"
    ipv6_cidr_blocks = var.lab_env_ipv6_block
  }

  ingress {
    description      = "Saltstack to VPC"
    from_port        = 4506
    to_port          = 4506
    protocol         = "tcp"
    ipv6_cidr_blocks = var.lab_env_ipv6_block
  }

  egress {
    description      = "Saltstack from VPC"
    from_port        = 4506
    to_port          = 4506
    protocol         = "tcp"
    ipv6_cidr_blocks = var.lab_env_ipv6_block
  }

  ingress {
    description      = "Rsylog to VPC"
    from_port        = 514
    to_port          = 514
    protocol         = "tcp"
    ipv6_cidr_blocks = var.lab_env_ipv6_block
  }

  ingress {
    description      = "filebeat to VPC"
    from_port        = 5044
    to_port          = 5044
    protocol         = "tcp"
    ipv6_cidr_blocks = ["<monitor01_ip>"]
  }

  egress {
    description      = "filebeat from VPC"
    from_port        = 5044
    to_port          = 5044
    protocol         = "tcp"
    ipv6_cidr_blocks = ["<monitor01_ip>"]
  }

  tags = {
    Name = "allow selective ports"
  }
}
