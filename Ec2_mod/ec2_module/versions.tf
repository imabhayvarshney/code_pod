terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.20"
    }
  }
}
/*
terraform {
  backend "s3" {
    bucket = "mybucket"
  }
}
*/