resource "google_compute_firewall" "ssh-firewall" {
  name    = "ssh-firewall"
  direction     = "INGRESS"
  source_ranges =  [ "35.235.240.0/20" ]
    network    = google_compute_network.vpc_network.name
  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_tags = ["bastion-vm"]
}

