terraform {
  required_version = ">= 1.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.45"
    }
  }
}

provider "aws" {
  region = "ap-southeast-2"
  default_tags {
    tags = {
      Environment = "POC"
      Project     = "PAN-CCM-CICD-POC"
      Repositorty = "github.com/n3mawashi/pan-ssm-cicd-poc"
      ManagedBy   = "Terraform/Ansible"
    }
  }
}
