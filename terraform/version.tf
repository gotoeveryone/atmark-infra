terraform {
  required_version = "~> 1.0"

  backend "remote" {
    organization = "k2ss"

    workspaces {
      name = "atmark-infra"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.31.0"
    }
  }
}
