provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

resource "aws_s3_bucket" "b" {
  bucket = "ludmer2-tf-test-bucket"
  acl    = "private"

  tags = {
    "Name"                    = "My bucket"
    Unquoted1                 = "I wanna be quoted"
    "AnotherName"             = "Yo"
    Unquoted2                 = "I really wanna be quoted"
    Unquoted3                 = "I really really wanna be quoted and I got a comma",
    join("-", ["foo", "bar"]) = "Test function"
    (local.localTagKey)       = "Test expression"
    "${local.localTagKey2}"   = "Test variable as key"
    "Yo-${local.localTagKey}" = "Test variable inside key"
    "Test variable as value" = "${local.localTagKey}"
    "Test variable inside value"  = "Yo-${local.localTagKey}"
  }
}

locals {
  localTagKey = "localTagKey"
  localTagKey2 = "localTagKey2"
}
