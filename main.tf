terraform {
  backend "local" {
   path = "terraform/state/terraform.tfstate"
  }
}

provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

resource "google_storage_bucket" "tf_state" {
  name = var.tf_state_bucket_name
  location = var.gcp_region
  uniform_bucket_level_access = true
  labels = {
    purpose = "terraform-state-bucket"
  }
  
  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}

output "state_bucket_name" {
  description = "The name of the GCS bucket storing Terraform state."
  value       = google_storage_bucket.tf_state.name
}
