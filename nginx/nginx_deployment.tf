resource "kubernetes_deployment" "nginx_deployement" {
  metadata {
    name = "${var.metadata_name_deploy}"
  }

  spec {
    replicas = "${var.replicas_number}"

    selector {
      match_labels = {
        app= "${var.label_pod}"
      }
    }

    template {
      metadata {
        labels = {
        app= "${var.label_pod}"
        }
      }

      spec {
        container {
          image = "nginx:latest"
          name  = "nginx"

          liveness_probe {
            http_get {
              path = "/nginx_status"
              port = 80

              http_header {
                name  = "X-Custom-Header"
                value = "Hello my NGINX"
              }
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}