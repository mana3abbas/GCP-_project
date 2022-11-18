resource "google_container_cluster" "gke_cluster" {
  name     = "gke-cluster"
  location = "us-central1-a"
  remove_default_node_pool = true
  
  initial_node_count       = 1
  ip_allocation_policy {
  }
   network    = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.Restricted_Subnet.name


  logging_service = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"
  
# enable cluster is private
  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "172.5.0.0/28"
  }
#update is stable
  release_channel {
      channel = "STABLE"
  }

  ###########access (authorize) vm to gke
    master_authorized_networks_config {
    cidr_blocks {
        cidr_block   = "10.0.0.0/24"
        display_name = "External Control Plane access"
      }
  }

}
