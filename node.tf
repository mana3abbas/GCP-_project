resource "google_container_node_pool" "cluster-node" {
  name           = "cluster-node"
  location       = "us-central1-a"
  cluster        = google_container_cluster.gke_cluster.name
  node_count     = 2

  node_config {
    machine_type = "e2-medium"
    service_account = google_service_account.gke_sacc.email

  }

  
}
