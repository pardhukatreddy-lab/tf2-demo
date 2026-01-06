provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

module "vpc" {
  source = "./vm_module/vpc_module"
  gcp_project_id = var.gcp_project_id
  vpc_name       = var.vpc_name
  auto_create_subnetworks = var.auto_create_subnetworks
}

module "compute" {
  source = "./vm_module/compute_module"
  project_id    = var.project_id
  gcp_zone          = var.gcp_zone
  vm_instance_name  = var.vm_instance_name
  vm_instance_count = var.vm_instance_count
  vm_machine_type   = var.vm_machine_type
  vm_image          = var.vm_image
  network_name      = module.vpc.vpc_network_name
  depends_on = [module.vpc]
}

