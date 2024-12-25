terraform {
  backend "s3" {
    bucket         = "hmx-terraform-bucket"
    key            = "eks/prod/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "eks-tf-prod-table"
    encrypt        = true
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


provider "aws" {
  region = var.aws_region
}


