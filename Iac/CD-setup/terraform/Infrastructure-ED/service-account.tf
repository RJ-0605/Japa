# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account
resource "google_service_account" "kp-service-account" {
  account_id = "kp-service-account"
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam
resource "google_project_iam_member" "kp-service-account" {
  project = "awinteck-solutions-a"
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.kp-service-account.email}"
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account_iam
resource "google_service_account_iam_member" "kp-service-account" {
  service_account_id = google_service_account.kp-service-account.id
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:awinteck-solutions-a.svc.id.goog[staging/kp-service-account]"
}


resource "google_project_iam_member" "allow_image_pull" {
  project = "awinteck-solutions-a"
  role   = "roles/artifactregistry.reader"
  member  = "serviceAccount:${google_service_account.kp-service-account.email}"
}