# 1. Define the Google Cloud Provider
provider "google" {
  project = "your-project-id"
  region  = "us-central1"
}

# 2. Create the Cloud SQL PostgreSQL Instance
resource "google_sql_database_instance" "postgres_instance" {
  name             = "my-postgres-db"
  database_version = "POSTGRES_15"
  region           = "us-central1"

  # Setting to "false" allows terraform destroy to remove the instance.
  # Be cautious with this setting in production.
  deletion_protection = false

  settings {
    # 'tier' specifies the machine type. 'db-f1-micro' is for small workloads.
    tier = "db-f1-micro"

    backup_configuration {
      enabled    = true
      start_time = "04:00" # HH:MM in UTC
    }

    ip_configuration {
      # For initial setup, public IP is simplest. Use private IP for production.
      ipv4_enabled = true
    }
  }
}

# 3. Create a Database inside the instance
resource "google_sql_database" "my_db" {
  name     = "app_database"
  instance = google_sql_database_instance.postgres_instance.name
}

# 4. Create a Database User
resource "google_sql_user" "db_user" {
  name     = "admin_user"
  instance = google_sql_database_instance.postgres_instance.name
  password = "your-secure-password" # Use a secret manager for production
}
