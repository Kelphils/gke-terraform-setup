resource "kubernetes_namespace" "farm" {
  metadata {
    annotations = {
      name = "${var.project_id}-farm-namespace"
    }
    labels = {
      mylabel = "${var.env_name}-${var.project_id}-farm"
    }
  }
}

resource "google_compute_address" "default" {
  name   = var.vpc_name
  region = var.gcp_region
}
resource "kubernetes_service" "farm-service" {
  metadata {
    namespace = kubernetes_namespace.farm.metadata[0].name
    name      = "farm"
  }
  spec {
    selector = {
      run = "farm"
    }
    session_affinity = "ClientIP"
    port {
      protocol    = "TCP"
      port        = 80
      target_port = 80
    }
    type             = "LoadBalancer"
    load_balancer_ip = google_compute_address.default.address
  }
}
resource "kubernetes_replication_controller" "farm-control" {
  metadata {
    name      = "farm"
    namespace = kubernetes_namespace.farm.metadata[0].name
    labels = {
      mylabel = "${var.env_name}-${var.project_id}-farm"
    }
  }
  spec {
    selector = {
      run = "farm"
    }
    template {
      metadata {
        labels = {
          mylabel = "${var.env_name}-${var.project_id}-farm"
        }
      }
      spec {
        container {
          image = "${var.repo_name}:latest"
          name  = "${var.project_id}-animal-farm-repo"
          liveness_probe {
            http_get {
              path = "/"
              port = 80

              http_header {
                name  = "X-Custom-Header"
                value = "Awesome"
              }
            }

            initial_delay_seconds = 20
            period_seconds        = 3
          }

          resources {
            limits = {
              cpu    = "1"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}



# configure kubectl with the credentials of the GKE cluster
# resource "null_resource" "configure_kubectl" {
#   provisioner "local-exec" {
#     command = "gcloud container clusters get-credentials ${var.gke_cluster.name} --region ${var.region} "

#     # Use environment variables to allow custom kubectl config paths
#     environment = {
#       KUBECONFIG = var.kubectl_config_path != "" ? var.kubectl_config_path : ""
#     }
#   }

# }
