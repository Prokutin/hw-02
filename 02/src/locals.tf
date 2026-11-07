locals {
  project     = "netology"
  env         = var.vpc_name
  vm_web_name = "${local.project}-${local.env}-platform-web"
  vm_db_name  = "${local.project}-${local.env}-platform-db"
}
