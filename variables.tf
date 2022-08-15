variable "env_name" {
  type        = string
  description = "Environment name"
}

# variable "gcp_auth_file" {
#   type        = string
#   description = "GCP authentication file"
# }

variable "gcp_region" {
  type        = string
  description = "GCP region"
}

variable "gcp_project" {
  type        = string
  description = "GCP project id"
}

# variable "ip_range_pods_name" {
#   description = "The secondary ip range to use for pods"
#   default     = "cluster-ip-range-pods"
# }
# variable "ip_range_services_name" {
#   description = "The secondary ip range to use for services"
#   default     = "cluster-ip-range-services"
# }

variable "gke_num_nodes" {
  type        = number
  description = "number of gke nodes"
}

variable "gke_cluster_name" {
  type        = string
  description = "gke cluster name"
}

