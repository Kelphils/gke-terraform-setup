output "vpc_name" {
  value       = google_compute_network.vpc.name
  description = "The name of the VPC"
}

output "vpc_id" {
  value       = google_compute_network.vpc.id
  description = "The id of the VPC"
}

output "subnet_name" {
  value       = google_compute_subnetwork.subnet.name
  description = "The name of the subnet"
}
output "services_secondary_range_name" {
  value       = google_compute_subnetwork.subnet.secondary_ip_range[0].range_name
  description = "The name of the services secondary range"
}
