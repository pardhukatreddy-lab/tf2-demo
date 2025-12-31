terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "google" {
  project = var.project
  region  = var.region
  # Credentials should be provided via the GOOGLE_CREDENTIALS environment variable or by running
  # `gcloud auth application-default login` before `terraform apply`.
}

variable "project" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

resource "google_service_account" "tf_sa" {
  account_id   = "tf-sa"
  display_name = "Terraform Service Account"
}

# Uncomment to create a key for the service account (store securely!)
# resource "google_service_account_key" "tf_sa_key" {
#   service_account_id = google_service_account.tf_sa.name
#}

# Example: grant the service account the Storage Admin role on the project
# resource "google_project_iam_member" "sa_storage_admin" {
#   project = var.project
#   role    = "roles/storage.admin"
#   member  = "serviceAccount:${google_service_account.tf_sa.email}"
#}

output "service_account_email" {
  value       = google_service_account.tf_sa.email
  description = "Email of the created service account"
}
