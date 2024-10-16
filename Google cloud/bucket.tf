resource "google_storage_bucket" "default" {
  name          = "cccg6-frontend-bucket"
  location      = "europe-west1"
  uniform_bucket_level_access = true
  storage_class = "STANDARD"   

  force_destroy = true          

  versioning {
    enabled = true  # Enable versioning for the bucket
  }

  website {
    main_page_suffix = "index.html"  
    not_found_page   = "404.html"    
  }
}

# make bucket public
resource "google_storage_bucket_iam_member" "default" {
  bucket = google_storage_bucket.default.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}

resource "google_compute_global_address" "default" {
  name = "example-ip"
}

resource "google_compute_backend_bucket" "default" {
  name        = "frontend"
  description = "Contains frontend application"
  bucket_name = google_storage_bucket.default.name
  enable_cdn  = true
  cdn_policy {
    cache_mode        = "CACHE_ALL_STATIC"
    client_ttl        = 3600
    default_ttl       = 3600
    max_ttl           = 86400
    negative_caching  = true
    serve_while_stale = 86400
  }
}

resource "google_compute_url_map" "default" {
  name            = "http-lb"
  default_service = google_compute_backend_bucket.default.id
}

resource "google_compute_target_http_proxy" "default" {
  name    = "http-lb-proxy"
  url_map = google_compute_url_map.default.id
}

resource "google_compute_global_forwarding_rule" "default" {
  name                  = "http-lb-forwarding-rule"
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL"
  port_range            = "80"
  target                = google_compute_target_http_proxy.default.id
  ip_address            = google_compute_global_address.default.id
}


