variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-east-2"
}

variable "delegation_role" {
  default     = "arn:aws:iam::<Account_ID>:role/OrganizationAccountAccessRole"
  description = "Role used for delegation."
}

variable "vpc_cidr" {
  default     = "192.168.25.0/24"
  description = "IPv4 Address space to use"
}

variable "vpc_cidr_ipv6" {
  default     = "2600:1f16:115:dc00::/64"
  description = "IPv6 address space to use"
}

variable "subnet_availability_zone" {
  default     = "us-east-2a"
  description = "Regions subnets availability zone."
}

variable "lab_env_ipv6_block" {
  default     = ["2001:a341:9da1::/64"]
  description = "IPv6 address range using in the Lab environment."
}
