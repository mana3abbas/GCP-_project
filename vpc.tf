resource "google_compute_network" "vpc_network" {
  project                 = "monas-project-367813"
  name                    = "vpc-network"
  auto_create_subnetworks = false
  mtu                     = 1460
}
