# GKE Cluster
resource "google_container_cluster" "primary" {
  name     = "my-cluster"
  location = "${var.gke_region}"

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {
 
    client_certificate_config {
      issue_client_certificate = false
    }
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    machine_type = "n1-standard-1"
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}


