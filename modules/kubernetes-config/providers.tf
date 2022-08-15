terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}


provider "kubernetes" {
  # load_config_file       = false
  host                   = var.cluster_endpoint
  cluster_ca_certificate = var.cluster_ca_cert
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["container", "clusters", "get-credentials", var.cluster_name, "--region", var.gcp_region]
    command     = "gcloud"
  }
}

# We use this data provider to expose an access token for communicating with the GKE cluster.
# data "google_client_config" "client" {}
