resource "google_service_account" "instance_srvacc" {
  account_id   = "instance-srvacc"
  display_name = "instance-srvacc"
}
resource "google_project_iam_member" "member_1" {
  project = "monas-project-367813"
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.instance_srvacc.email}"

}
resource "google_compute_instance" "bastion" {
  name         = "bastion-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"
  tags = ["bastion-vm"]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network    = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.Management_Subnet.name
  }

  labels = {
    "name" = "private-vm"
  }
service_account {
    email  = google_service_account.instance_srvacc.email
    scopes = ["cloud-platform"]
  }
}

