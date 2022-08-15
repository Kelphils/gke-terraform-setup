output "gke-cluster-name" {
  value       = google_container_cluster.primary.name
  description = "The name of the GKE cluster"
}

output "node_version" {
  value = google_container_cluster.primary.node_version
}

output "gke_cluster_host" {
  value       = google_container_cluster.primary.endpoint
  description = "The host of the GKE cluster"
}

output "gke_cluster_client_certificate" {
  value       = base64decode(google_container_cluster.primary.master_auth[0].client_certificate)
  description = "The credentials of the GKE cluster"
}

output "gke_cluster_credentials_key" {
  value       = base64decode(google_container_cluster.primary.master_auth[0].client_key)
  description = "The key of the GKE cluster"
}

output "gke_cluster_certificate" {
  value       = base64decode(google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
  description = "The certificate of the GKE cluster"
}


# cat docker-key.json | docker login -u _json_key_base64 --password-stdin \
# https://europe-west4-docker.pkg.dev

# base64 plucky-cargo-359113-679e01686057.json > docker-key.json

# base64 FILE-NAME > NEW-FILE-NAME

# cat KEY-FILE | docker login -u KEY-TYPE --password-stdin \
# https://LOCATION-docker.pkg.dev

# dev-plucky-cargo-359113-animal-farm-repo

# docker build -t europe-west4-docker.pkg.dev/plucky-cargo-359113/plucky-cargo-359113-animal-farm-repo .
# docker push LOCATION-docker.pkg.dev/PROJECT-ID/REPOSITORY/IMAGE

# gcloud container clusters get-credentials $(terraform output -raw gke_cluser_name) --region $(terraform output -raw region)

# gcloud auth activate-service-account
# gcloud auth activate-service-account terraform-automation@plucky-cargo-359113.iam.gserviceaccount.com --key-file=plucky-cargo-359113-679e01686057.json --project=plucky-cargo-359113
