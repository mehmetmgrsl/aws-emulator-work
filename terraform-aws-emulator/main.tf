terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region     = "eu-central-1"

  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  s3_use_path_style = true

  endpoints {
    s3 = "https://127.0.0.1:9297"
  }
}

resource "aws_s3_bucket" "demo" {
  bucket = "terraform-local-test-bucket"

  tags = {
    Environment = "Local"
    ManagedBy   = "Terraform"
  }
}