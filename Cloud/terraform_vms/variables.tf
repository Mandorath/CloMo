variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "eu-west-1"
}

variable "instance_type" {
  default     = "t2.micro"
  description = "AWS instance type"
}

variable "ubuntu_ami" {
  default     = "ami-0aef57767f5404a3c"
  description = "AWS Ubuntu 20.04 LTS ami"
}

variable "delegation_role" {
  default     = "arn:aws:iam::<Account_ID>:role/OrganizationAccountAccessRole"
  description = "Role used for delegation."
}

variable "subnet_id" {
  default     = "subnet-05d455dcae2c69d76"
  description = "Subnet to use for the AWS instances."
}

variable "security_group_id" {
  default     = ["sg-0492613621e878bf4"]
  description = "Security group to apply to the AWS instances."
}
