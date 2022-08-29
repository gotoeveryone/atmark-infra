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
      version = ">= 3.34.0"
    }
  }
}

provider "aws" {
  profile = var.profile
  region  = var.region
}

module "base" {
  region       = var.region
  prefix       = var.prefix
  user         = var.user
  allow_ssh_ip = var.allow_ssh_ip
  source       = "./modules"
}
