variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "eu-west-1"
}

variable "cloudtrail_bucket" {
  default     = "cloudtrail-bucket"
  description = "Bucket name to use for cloudtrail"
}
