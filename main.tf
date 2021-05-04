terraform {
  backend "remote" {}
}

provider "aws" {
  region = "eu-north-1"
}

resource "random_pet" "petname" {
  length    = 4
  separator = "-"
}

resource "aws_s3_bucket" "dev" {
  bucket = "sentinel-ws-${random_pet.petname.id}"
  acl    = "public-read"
  force_destroy = true

  tags = {
    environment = "dev"
  }

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::sentinel-ws-${random_pet.petname.id}/*"
            ]
        }
    ]
}
EOF
}

