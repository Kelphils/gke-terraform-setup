data "local_file" "path" {
  filename = "../plucky-cargo-359113-679e01686057.json"
}

provider "google" {
  project     = var.gcp_project
  credentials = data.local_file.path.filename
  # credentials = file(var.gcp_auth_file)
  region = var.gcp_region
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>4.0"

    }
  }
  backend "gcs" {
    bucket = "kelvin-cloud-global-gcs"
    prefix = "terraform/gke-tfstate"
  }

  required_version = ">= 1.2"
}

# export GOOGLE_APPLICATION_CREDENTIALS="/Users/kelvinobioha/downloads/plucky-cargo-359113-679e01686057.json"

# export TF_VAR_GOOGLE_APPLICATION_CREDENTIALS=plucky-cargo-359113-679e01686057.json
