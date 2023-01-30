resource "kubernetes_deployment" "my_ak_deployment" {
  metadata {
    name = "my-ak-deployment"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "java-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "java-app"
        }
      }

      spec {
        container {
          name  = "my-java-app"
          image = "sherqodirov/mywebapp:latest"

          port {
            container_port = 8085
          }

          image_pull_policy = "Always"
        }
      }
    }
  }
}

resource "kubernetes_service" "java_app_svc" {
  metadata {
    name = "java-app-svc"
  }

  spec {
    port {
      protocol    = "TCP"
      port        = 8085
      target_port = "8085"
    }

    selector = {
      app = "java-app"
    }

    type = "LoadBalancer"
  }
}
