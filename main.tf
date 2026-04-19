terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# Create VM
resource "google_compute_instance" "debian_vm" {
  name         = "debian-vm"
  machine_type = "n1-standard-1"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 10
    }
  }

  network_interface {
    network = "default"

    access_config {
      # Required for public IP
    }
  }

  metadata = {
    enable-oslogin = "FALSE"
  }

  tags = ["http-server"]

  labels = {
    environment = "sandbox"
  }
}