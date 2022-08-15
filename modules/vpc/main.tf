# VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.env_name}-${var.gcp_project}-vpc"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.env_name}-${var.gcp_project}-subnet"
  region        = var.gcp_region
  network       = google_compute_network.vpc.self_link
  ip_cidr_range = "10.3.0.0/16"

  secondary_ip_range {
    range_name    = "${var.env_name}-${var.gcp_project}-services-ip-ranges"
    ip_cidr_range = "10.4.0.0/16"
  }
}
