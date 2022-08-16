module "vpc" {
  source      = "./modules/vpc"
  env_name    = var.env_name
  gcp_region  = var.gcp_region
  gcp_project = var.gcp_project

}

module "gke" {
  source                        = "./modules/gke"
  env_name                      = var.env_name
  gcp_project                   = var.gcp_project
  project_id                    = var.gcp_project
  gke_num_nodes                 = var.gke_num_nodes
  gke_cluster_name              = var.gke_cluster_name
  gcp_region                    = var.gcp_region
  vpc_name                      = module.vpc.vpc_name
  subnet_name                   = module.vpc.subnet_name
  services_secondary_range_name = module.vpc.services_secondary_range_name
}

# module "gcr" {
#   source      = "./modules/gcr"
#   env_name    = var.env_name
#   gcp_project = var.gcp_project
#   gcp_region  = var.gcp_region
# }

module "k8s-config" {
  source             = "./modules/kubernetes-config"
  env_name           = var.env_name
  gcp_region         = var.gcp_region
  project_id         = var.gcp_project
  client_certificate = module.gke.gke_cluster_certificate
  vpc_name           = module.vpc.vpc_name
  cluster_endpoint   = module.gke.gke_cluster_host
  cluster_ca_cert    = module.gke.gke_cluster_client_certificate
  client_key         = module.gke.gke_cluster_credentials_key
  cluster_name       = var.gke_cluster_name




}
# AIzaSyDZ-5ktxNXdqrQnMHDpIYsEfl1o0UbTH_Q
# key=API_KEY
