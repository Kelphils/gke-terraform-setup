variable "env_name" {
  type        = string
  description = "Environment name"
}

variable "gke_num_nodes" {
  type        = number
  description = "number of gke nodes"
}

variable "gke_cluster_name" {
  type        = string
  description = "gke cluster name"
}

variable "kubernetes_version" {
  default = "1.22"
}

variable "project_id" {
  description = "gcp project id"
}

variable "gcp_region" {
  type        = string
  description = "GCP region"
}

variable "vpc_name" {
  type        = string
  description = "The name of the VPC"
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet"
}

variable "services_secondary_range_name" {
  type        = string
  default     = null
  description = "The name of the secondary range within the subnetwork for the services to use"
}
# variable "gcp_auth" {
#   type        = string
#   description = "GCP authentication file"
# }
variable "gcp_project" {
  type        = string
  description = "GCP project id"
}

