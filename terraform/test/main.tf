provider "aws" {
  version = "~> 2.0"
  region  = "eu-north-1"
}

resource "aws_s3_bucket" "bucket_asset" {
  bucket = "bekk-aws-tf-ws-asset"
  acl    = "private"

  tags = {
    Managed     = "Terraform"
  }
}

resource "aws_s3_bucket_policy" "bucket_asset" {
  bucket = "${aws_s3_bucket.bucket_asset.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "Policy1582630604704",
  "Statement": [
    {
      "Sid": "Stmt1582630385628",
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "s3:GetObject"
      ],
      "Resource": "${aws_s3_bucket.bucket_asset.arn}/*"
    }
  ]
}
POLICY
}

resource "aws_s3_bucket" "bucket_host" {
  bucket = "bekk-aws-tf-ws-host"
  acl    = "private"

  tags = {
    Managed     = "Terraform"
  }
}

resource "aws_s3_bucket_policy" "bucket_host" {
  bucket = "${aws_s3_bucket.bucket_host.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "Policy1582630604704",
  "Statement": [
    {
      "Sid": "Stmt1582630385628",
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "s3:GetObject"
      ],
      "Resource": "${aws_s3_bucket.bucket_host.arn}/*"
    }
  ]
}
POLICY
}