provider "aws" {
  region = var.AWS_REGION
}

terraform {
  required_version = ">= 0.12"
}
