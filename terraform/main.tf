provider "aws" {
  profile = var.profile
  region = var.region

  version = ">= 3.34.0"
}

module "base" {
  region = var.region
  prefix = var.prefix
  user = var.user
  allow_ssh_ip = var.allow_ssh_ip
  source = "./modules"
}
