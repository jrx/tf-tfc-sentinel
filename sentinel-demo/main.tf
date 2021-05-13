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
  acl    = "private"
  force_destroy = true

  tags = {
    environment = "dev"
    owner = "jan"
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

resource "aws_instance" "example" {
  ami                    = "ami-0358414bac2039369"
  instance_type          = "t3.micro"
  count                  = 1

  tags = {
    Name  = "${random_pet.petname.id}-${count.index}"
    owner = "jrx"
    # Keep = ""
  }
}
