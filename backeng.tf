terraform {
  backend "gcs" {
    bucket = "pardhu-terraform2"
    prefix = "terraform/state"
  }
}