resource "google_cloud_run_v2_service" "cloud_bite_backend" {
  name     = "cloud-bite-backend"
  ingress = "INGRESS_TRAFFIC_ALL"
  location = "europe-west1"

  depends_on = [google_sql_database_instance.instance]

template {
    scaling {
      max_instance_count = 2
    }

    volumes {
      name = "cloudsql"
      cloud_sql_instance {
        instances = [google_sql_database_instance.instance.connection_name]
      }
    }

    containers {
      image = "gcr.io/cloud-bite-sdu-401607/cloud-bite-backend"

          env {
        name = "DBHOST1"
        value = google_sql_database_instance.instance.private_ip_address
      }

            env {
        name = "DB_USERNAME"
        value_source {
          secret_key_ref {
            secret = data.google_secret_manager_secret_version.db_user.secret
            version = "latest"
          }
        }
      }

      
            env {
        name = "DB_PASSWORD"
        value_source {
          secret_key_ref {
            secret = data.google_secret_manager_secret_version.db_password.secret
            version = "latest"
          }
        }
      }

      
            env {
        name = "DB_NAME"
        value_source {
          secret_key_ref {
            secret = data.google_secret_manager_secret_version.db_name.secret
            version = "latest"
          }
        }
      }

 
      ports {
        container_port = 3000
      }

      volume_mounts {
        name       = "cloudsql"
        mount_path = "/cloudsql"
      }
    }
        vpc_access {
      # Use the VPC Connector
      connector = google_vpc_access_connector.connector.id
      # all egress from the service should go through the VPC Connector
      egress = "ALL_TRAFFIC"
    }
  }

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }
}

resource "google_cloud_run_service_iam_binding" "invoker" {
  location = google_cloud_run_v2_service.cloud_bite_backend.location
  service  = google_cloud_run_v2_service.cloud_bite_backend.name
  role     = "roles/run.invoker"
  members = [
    "allUsers"
  ]
}



resource "google_project_iam_member" "cloudbuild_secret_accessor" {
  project = "cloud-bite-sdu-401607"
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:575377745994-compute@developer.gserviceaccount.com"
}
