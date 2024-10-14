resource "google_sql_database_instance" "instance" {
  name             = "cloud-bite-mysql-instance"
  database_version = "MYSQL_8_0"
  project          = "cloud-bite-sdu-401607"  # Replace with your actual project ID
  region           = "europe-west1"
  settings {
    tier = "db-f1-micro"
        ip_configuration {
      ipv4_enabled = false
      private_network = google_compute_network.vpc_network.self_link
      }
    }
    deletion_protection = false
    depends_on = [google_service_networking_connection.connection]
  }

resource "google_sql_database" "db" {
  name     = "cloud-bite-database"
  instance = google_sql_database_instance.instance.name
}

resource "google_sql_user" "user" {
  name     = var.user
  password = var.password
  instance = google_sql_database_instance.instance.name
}

variable "user" {
  type        = string
  description = "The SQL user to deploy to"
}

variable "password" {
  type        = string
  description = "The SQL password to deploy to"
}



