terraform {
  required_version = ">= 0.13"
}

provider "aws" {
  region = var.aws_region
  assume_role {
    role_arn = "arn:aws:iam::<ID>:role/OrganizationAccountAccessRole"
  }
}


resource "aws_s3_bucket" "dasbo_store" {
  bucket = var.bucket_name
  acl    = "private"

  tags = {
    Name = "Default bucket"
  }
}

resource "aws_iam_group" "restricted_ec2" {
  name = "restricted_ec2"
}

resource "aws_iam_group" "restricted_s3" {
  name = "restricted_s3"
}

resource "aws_iam_group_policy" "restricted_ec2_policy" {
  name  = "restricted_ec2_policy"
  group = aws_iam_group.restricted_ec2.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "ec2:Describe*",
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_group_policy" "restricted_s3_policy" {
  name  = "restricted_s3_policy"
  group = aws_iam_group.restricted_s3.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Resource": "arn:aws:s3:::<bucket_name>"
        }
    ]
}
EOF
}

resource "aws_iam_group_membership" "ec2_group_mem" {
  name = "ec2-group-membership"

  users = [
    aws_iam_user.gith.name,
    aws_iam_user.gitlab.name,
    aws_iam_user.bitb.name,
    aws_iam_user.source.name,
    aws_iam_user.paste.name,
    aws_iam_user.fr_gith.name,
    aws_iam_user.fr_gitlab.name,
    aws_iam_user.fr_bitb.name,
    aws_iam_user.fr_source.name,
    aws_iam_user.ma_gith.name,
    aws_iam_user.ma_gitlab.name,
    aws_iam_user.ma_bitb.name,
    aws_iam_user.ma_source.name,
    aws_iam_user.ff_gith.name,
    aws_iam_user.ff_gitlab.name,
    aws_iam_user.ff_bitb.name,
    aws_iam_user.ff_source.name,
    aws_iam_user.md_gith.name,
    aws_iam_user.md_gitlab.name,
    aws_iam_user.md_bitb.name,
    aws_iam_user.md_source.name,
    aws_iam_user.ww_gith.name,
    aws_iam_user.ww_gitlab.name,
    aws_iam_user.ww_bitb.name,
    aws_iam_user.ww_source.name
  ]

  group = aws_iam_group.restricted_ec2.name
}

resource "aws_iam_group_membership" "s3_group_mem" {
  name = "s3-group-membership"

  users = [
    aws_iam_user.gith.name,
    aws_iam_user.gitlab.name,
    aws_iam_user.bitb.name,
    aws_iam_user.source.name,
    aws_iam_user.paste.name,
    aws_iam_user.fr_gith.name,
    aws_iam_user.fr_gitlab.name,
    aws_iam_user.fr_bitb.name,
    aws_iam_user.fr_source.name,
    aws_iam_user.ma_gith.name,
    aws_iam_user.ma_gitlab.name,
    aws_iam_user.ma_bitb.name,
    aws_iam_user.ma_source.name,
    aws_iam_user.ff_gith.name,
    aws_iam_user.ff_gitlab.name,
    aws_iam_user.ff_bitb.name,
    aws_iam_user.ff_source.name,
    aws_iam_user.md_gith.name,
    aws_iam_user.md_gitlab.name,
    aws_iam_user.md_bitb.name,
    aws_iam_user.md_source.name,
    aws_iam_user.ww_gith.name,
    aws_iam_user.ww_gitlab.name,
    aws_iam_user.ww_bitb.name,
    aws_iam_user.ww_source.name
  ]

  group = aws_iam_group.restricted_s3.name
}

resource "aws_iam_user" "gith" {
  name = "milgith"

  tags = {
    tag-key = "github"
  }
}

resource "aws_iam_user" "gitlab" {
  name = "milgitl"

  tags = {
    tag-key = "gitlab"
  }
}

resource "aws_iam_user" "bitb" {
  name = "bitbucket"

  tags = {
    tag-key = "bitbucket"
  }
}

resource "aws_iam_user" "source" {
  name = "milsour"

  tags = {
    tag-key = "sourceforge"
  }
}

resource "aws_iam_user" "fr_gith" {
  name = "freekgith"

  tags = {
    tag-key = "github"
  }
}

resource "aws_iam_user" "fr_gitlab" {
  name = "freekgitl"

  tags = {
    tag-key = "gitlab"
  }
}

resource "aws_iam_user" "fr_bitb" {
  name = "freekbucket"

  tags = {
    tag-key = "bitbucket"
  }
}

resource "aws_iam_user" "fr_source" {
  name = "freeksour"

  tags = {
    tag-key = "sourceforge"
  }
}

resource "aws_iam_user" "ma_gith" {
  name = "martingith"

  tags = {
    tag-key = "github"
  }
}

resource "aws_iam_user" "ma_gitlab" {
  name = "martingitl"

  tags = {
    tag-key = "gitlab"
  }
}

resource "aws_iam_user" "ma_bitb" {
  name = "martinbucket"

  tags = {
    tag-key = "bitbucket"
  }
}

resource "aws_iam_user" "ma_source" {
  name = "martinsour"

  tags = {
    tag-key = "sourceforge"
  }
}

resource "aws_iam_user" "ff_gith" {
  name = "fransgith"

  tags = {
    tag-key = "github"
  }
}

resource "aws_iam_user" "ff_gitlab" {
  name = "fransgitl"

  tags = {
    tag-key = "gitlab"
  }
}

resource "aws_iam_user" "ff_bitb" {
  name = "fransbucket"

  tags = {
    tag-key = "bitbucket"
  }
}

resource "aws_iam_user" "ff_source" {
  name = "franssour"

  tags = {
    tag-key = "sourceforge"
  }
}

resource "aws_iam_user" "md_gith" {
  name = "maartengith"

  tags = {
    tag-key = "github"
  }
}

resource "aws_iam_user" "md_gitlab" {
  name = "maartengitl"

  tags = {
    tag-key = "gitlab"
  }
}

resource "aws_iam_user" "md_bitb" {
  name = "maartenbucket"

  tags = {
    tag-key = "bitbucket"
  }
}

resource "aws_iam_user" "md_source" {
  name = "maartensour"

  tags = {
    tag-key = "sourceforge"
  }
}

resource "aws_iam_user" "ww_gith" {
  name = "wilfredgith"

  tags = {
    tag-key = "github"
  }
}

resource "aws_iam_user" "ww_gitlab" {
  name = "wilfredgitl"

  tags = {
    tag-key = "gitlab"
  }
}

resource "aws_iam_user" "ww_bitb" {
  name = "wilfredbucket"

  tags = {
    tag-key = "bitbucket"
  }
}

resource "aws_iam_user" "ww_source" {
  name = "wilfredsour"

  tags = {
    tag-key = "sourceforge"
  }
}

resource "aws_iam_user" "paste" {
  name = "milpb"

  tags = {
    tag-key = "pastebin"
  }
}
