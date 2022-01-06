terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.68.0"
    }
  }
}

provider "aws" {
  region = var.region
  secret_key = var.aws_secret_key
  access_key = var.aws_access_key
}

