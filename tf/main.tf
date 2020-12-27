terraform {
  required_version = ">= 0.11.8"
}

provider "aws" {
  version = ">= 1.47.0"
  region  = "${var.region}"
}

data "aws_availability_zones" "available" {}