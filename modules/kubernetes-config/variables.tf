variable "cluster_endpoint" {
  type        = string
  description = "GKE cluster endpoint"
}

variable "cluster_ca_cert" {
  type        = string
  description = "GKE cluster CA cert"
}

variable "client_certificate" {
  type        = string
  description = "GKE client certificate"
}

variable "client_key" {
  type        = string
  description = "GKE client key"
}

variable "repo_name" {
  type        = string
  description = "GCR repo name"
  default     = "europe-west4-docker.pkg.dev/plucky-cargo-359113/plucky-cargo-359113-animal-farm-repo"
}

variable "env_name" {
  type        = string
  description = "Environment name"
}

variable "gcp_region" {
  type        = string
  description = "GCP region"
}

variable "project_id" {
  type        = string
  description = "GCP project id"
}

variable "vpc_name" {
  type        = string
  description = "VPC name"
}

variable "cluster_name" {
  type        = string
  description = "GKE cluster name"
}
