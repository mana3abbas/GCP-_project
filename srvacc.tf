resource "google_service_account" "gke_sacc" {
  account_id   = "gke-sacc"
  display_name = "gke-sacc"
}


resource "google_project_iam_member" "storage-useradmin" {
  project = "monas-project-367813"
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.gke_sacc.email}"

}

resource "google_project_iam_member" "gke_admin_role" {
  project = "monas-project-367813"
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.gke_sacc.email}"
}
