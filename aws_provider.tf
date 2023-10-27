terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.22.0"
    }
    kubernetes = {
      source  = "registry.terraform.io/hashicorp/kubernetes"
      version = "~> 1.1"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
