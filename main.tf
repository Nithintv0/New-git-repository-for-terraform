provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

# Low-cost instance
resource "google_compute_instance" "low_cost_vm1" {
  name         = "low-cost-vm3"
  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12" # small, common Linux image
      size  = 10                       # GB (keep small to reduce cost)
      type  = "pd-standard"
    }
  }
}

# Low-cost instance
resource "google_compute_instance" "low_cost_vm2" {
  name         = "low-cost-vm2"
  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12" # small, common Linux image
      size  = 10                       # GB (keep small to reduce cost)
      type  = "pd-standard"
    }
  }
}

