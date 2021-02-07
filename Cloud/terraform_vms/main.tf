terraform {
  required_version = ">= 0.13"
}

provider "aws" {
  region = var.aws_region
  assume_role {
    role_arn = var.delegation_role
  }
}

data "template_file" "user_data_hm1" {
  template = file("cloud_init_hm1.cfg")
}

data "template_file" "user_data_hm2" {
  template = file("cloud_init_hm2.cfg")
}

data "template_file" "user_data_hm3" {
  template = file("cloud_init_hm3.cfg")
}

data "template_file" "user_data_hm4" {
  template = file("cloud_init_hm4.cfg")
}

resource "aws_instance" "hm_m1" {
  ami           = var.ubuntu_ami
  instance_type = var.instance_type

  private_ip         = "<IPv4_address>"
  user_data          = data.template_file.user_data_hm1.rendered
  ipv6_address_count = 1
  subnet_id          = var.subnet_id
  security_groups    = var.security_group_id
}

resource "aws_instance" "hm_m2" {
  ami           = var.ubuntu_ami
  instance_type = var.instance_type

  private_ip         = "<IPv4_address>"
  user_data          = data.template_file.user_data_hm2.rendered
  ipv6_address_count = 1
  subnet_id          = var.subnet_id
  security_groups    = var.security_group_id
}

resource "aws_instance" "hm_m3" {
  ami           = var.ubuntu_ami
  instance_type = var.instance_type

  private_ip         = "<IPv4_address>"
  user_data          = data.template_file.user_data_hm3.rendered
  ipv6_address_count = 1
  subnet_id          = var.subnet_id
  security_groups    = var.security_group_id
}

resource "aws_instance" "hm_m4" {
  ami           = var.ubuntu_ami
  instance_type = var.instance_type

  private_ip         = "<IPv4_address>"
  user_data          = data.template_file.user_data_hm4.rendered
  ipv6_address_count = 1
  subnet_id          = var.subnet_id
  security_groups    = var.security_group_id
}
