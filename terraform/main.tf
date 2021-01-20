provider "aws" {
  profile = var.profile
  region = var.region
}

module "base" {
  region = var.region
  prefix = var.prefix
  user = var.user
  source = "./modules"
}
