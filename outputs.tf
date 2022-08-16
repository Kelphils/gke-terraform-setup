output "vpc_name" {
  value       = module.vpc.vpc_name
  description = "The name of the VPC"
}
output "gke_cluser_name" {
  value       = module.gke.gke-cluster-name
  description = "The name of the GKE cluster"
}

output "gke_cluster_host" {
  value       = module.gke.gke_cluster_host
  description = "The host of the GKE cluster"
}

output "region" {
  value       = var.gcp_region
  description = "Gcp region deployed"
}

output "project_id" {
  value       = var.gcp_project
  description = "Gcp project id"
}

# output "repostory_name" {
#   value       = module.gcr.google_artifact_registry_repository_name
#   description = "Gcr repository name"
# }

output "loadbalancer_ip" {
  value       = module.k8s-config.load-balancer-ip
  description = "Loadbalancer ip"
}
