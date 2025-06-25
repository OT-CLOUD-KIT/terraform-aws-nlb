module "naming" {
  source   = "git@github.com:OT-CLOUD-KIT/terraform-aws-naming.git?ref=dev"
  bu       = var.bu
  env      = var.env
  app      = var.app
  tenant   = var.tenant
  resource = var.resource
}

module "standard_tags" {
  source = "git@github.com:OT-CLOUD-KIT/terraform-aws-standard-tagging.git?ref=dev"

  bu      = var.bu
  program = var.program
  app     = var.app
  team    = var.team
  region  = var.region
  env     = var.env
}


module "nlb" {
  source = "../" # adjust path if needed

  vpc_id                     = var.vpc_id
  subnet_ids                 = var.subnet_ids
  internal                   = var.internal
  cross_zone_enabled         = var.cross_zone_enabled
  bu                         = var.bu
  program                    = var.program
  team                       = var.team
  app                        = var.app
  env                        = var.env
  listeners                  = var.listeners
  allowed_cidrs              = var.allowed_cidrs
  create_sg                  = var.create_sg
  enable_sg_support          = var.enable_sg_support
  existing_sg_ids            = var.existing_sg_ids
  enable_deletion_protection = var.enable_deletion_protection
  region                     = var.region
}