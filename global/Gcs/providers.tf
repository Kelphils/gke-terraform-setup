provider "google" {
  project     = var.gcp_project
  credentials = file(var.gcp_auth_file)
  region      = var.gcp_region
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>4.0"

    }
  }
  backend "gcs" {
    bucket      = "kelvin-cloud-global-gcs"
    prefix      = "terraform/cgs-tfstate"
    credentials = "../../../../../../Downloads/plucky-cargo-359113-679e01686057.json"
  }

  required_version = ">= 1.2"
}
