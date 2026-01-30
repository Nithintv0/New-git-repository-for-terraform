provider "google" {
  project = "upheld-beach-485606-d1"
  region  = us-central1
  zone    = us-central1-a
}

# Low-cost instance
resource "google_compute_instance" "low_cost_vm" {
  name         = "low-cost-vm"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12" # small, common Linux image
      size  = 10                       # GB (keep small to reduce cost)
      type  = "pd-standard"
    }
  }

  network_interface {
    network = "default"
    # Omit access_config {} to avoid assigning an external IP (reduces exposure
    # and some possible charges). If you need external access, uncomment the
    # line below:
    # access_config {}
  }

  scheduling {
    preemptible         = true
    on_host_maintenance = "TERMINATE"
    automatic_restart   = false
  }

  # Use the default service account or specify one with limited roles
  service_account {
    email  = var.service_account_email
    scopes = var.service_account_scopes
  }

  labels = {
    cost = "low"
  }

  tags = ["low-cost"]
}
