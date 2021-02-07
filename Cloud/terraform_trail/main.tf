terraform {
  required_version = ">= 0.13"
}

provider "aws" {
  region = var.aws_region
}

data "aws_cloudtrail_service_account" "main" {}

resource "aws_s3_bucket_policy" "CloudTrailS3Bucket" {
  bucket = var.cloudtrail_bucket
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck20150319",
            "Effect": "Allow",
            "Principal": {
                "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::rp1-test-bucket"
        },
        {
            "Sid": "AWSCloudTrailWrite20150319",
            "Effect": "Allow",
            "Principal": {
                "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::rp1-test-bucket/AWSLogs/674540546041/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
          },
          {
              "Sid": "AWSCloudTrailWrite20150319",
              "Effect": "Allow",
              "Principal": {
                  "Service": [
                      "cloudtrail.amazonaws.com"
                  ]
              },
              "Action": "s3:PutObject",
              "Resource": "arn:aws:s3:::rp1-test-bucket/AWSLogs/o-l8dn0i19x6/*",
              "Condition": {
                  "StringEquals": {
                      "s3:x-amz-acl": "bucket-owner-full-control"
                  }
              }
          }
      ]
  }

POLICY
}

resource "aws_cloudtrail" "run_cloudtrail" {
  name                          = "master-cloudtrail-all"
  s3_bucket_name                = var.cloudtrail_bucket
  s3_key_prefix                 = ""
  include_global_service_events = true
  enable_log_file_validation    = false
  enable_logging                = false
  is_multi_region_trail         = true
  is_organization_trail         = true
  tags = {
    name = "Master Cloudtrail"
  }
  depends_on = [aws_s3_bucket_policy.CloudTrailS3Bucket]
}
