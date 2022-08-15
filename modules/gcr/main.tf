resource "google_artifact_registry_repository" "repo" {
  location      = var.gcp_region
  repository_id = "${var.gcp_project}-animal-farm-repo"
  description   = "Animal Farm Repository"
  format        = "DOCKER"
  project       = var.gcp_project
  labels = {
    "env" = var.env_name
  }
}

data "google_iam_policy" "repo-policy" {
  binding {
    role = "roles/artifactregistry.reader"
    members = [
      "serviceAccount:terraform-automation@plucky-cargo-359113.iam.gserviceaccount.com"
    ]
  }
}

resource "google_artifact_registry_repository_iam_policy" "policy" {
  project     = var.gcp_project
  location    = var.gcp_region
  repository  = google_artifact_registry_repository.repo.name
  policy_data = data.google_iam_policy.repo-policy.policy_data
}
