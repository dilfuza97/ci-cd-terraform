resource "kubernetes_deployment" "my_ak2_deployment" {
  metadata {
    name = "my-ak2-deployment"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "angular-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "angular-app"
        }
      }

      spec {
        container {
          name  = "my-angular-app"
          image = "akdevopscoaching/mywebapp:latest"

          port {
            container_port = 8085
          }

          image_pull_policy = "Always"
        }
      }
    }
  }
}

resource "kubernetes_service" "angular_app_svc" {
  metadata {
    name = "angular-app-svc"
  }

  spec {
    port {
      protocol    = "TCP"
      port        = 8085
      target_port = "8085"
    }

    selector = {
      app = "angular-app"
    }

    type = "LoadBalancer"
  }
}
