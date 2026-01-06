variable "project_id" {
  description = "The GCP project ID to deploy resources into."
  type        = string
}

variable "gcp_region" {
  description = "The GCP region for the resources."
  type        = string
  default     = "us-central1"
}

variable "gcp_zone" {
  description = "The GCP zone for the VM instance."
  type        = string
  default     = "us-central1-a"
}

variable "vm_instance_count" {
  description = "The number of VM instances to create."
  type        = number
  default     = 1
}

variable "vm_instance_name" {
  description = "The base name for the VM instances."
  type        = string
  default     = "pardhu-vm-0"
}

variable "vm_machine_type" {
  description = "The machine type for the VM."
  type        = string
  default     = "e2-small"
}

variable "vm_image" {
  description = "The boot disk image for the VM."
  type        = string
  default     = "debian-cloud/debian-11"
}

variable "network_name" {
  description = "The name of the VPC network to attach the VM to."
  type        = string
}
