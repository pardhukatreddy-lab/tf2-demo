resource "google_compute_instance" "default" {
  count        = var.vm_instance_count
  project      = var.project_id
  zone         = var.gcp_zone
  name         = "${lower(var.vm_instance_name)}-${count.index}"
  machine_type = var.vm_machine_type

  # Defines the boot disk and the image to use for the VM.
  boot_disk {
    initialize_params {
      image = var.vm_image
    }
  }

  network_interface {
    network = var.network_name
    access_config {
      // Ephemeral public IP
    }
  }
}
