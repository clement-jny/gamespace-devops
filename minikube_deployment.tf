provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "gamespace" {
  metadata {
    name = "gamespace"
  }
}

resource "kubernetes_deployment" "database" {
  metadata {
    name      = "database"
    namespace = kubernetes_namespace.gamespace.metadata[0].name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "database"
      }
    }

    template {
      metadata {
        labels = {
          app = "database"
        }
      }

      spec {
        container {
          image = "mariadb:latest"
          name  = "database"

          port {
            container_port = 3306
          }

          env {
            name  = "MYSQL_ROOT_PASSWORD"
            value = "root"
          }

          env {
            name  = "MYSQL_DATABASE"
            value = "gamespace"
          }

          env {
            name  = "MYSQL_USER"
            value = "gamespace-user"
          }

          env {
            name  = "MYSQL_PASSWORD"
            value = "gamespace-pass"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "database" {
  metadata {
    name      = "database-service"
    namespace = kubernetes_namespace.gamespace.metadata[0].name
  }

  spec {
    selector = {
      app = "database"
    }

    port {
      protocol    = "TCP"
      port        = 3306
      target_port = 3306
    }
  }
}

resource "kubernetes_deployment" "frontend" {
  metadata {
    name      = "frontend"
    namespace = kubernetes_namespace.gamespace.metadata[0].name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "frontend"
      }
    }

    template {
      metadata {
        labels = {
          app = "frontend"
        }
      }

      spec {
        container {
          image = "frontend-image:latest"
          name  = "frontend"

          port {
            container_port = 3000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "frontend" {
  metadata {
    name      = "frontend-service"
    namespace = kubernetes_namespace.gamespace.metadata[0].name
  }

  spec {
    selector = {
      app = "frontend"
    }

    port {
      protocol    = "TCP"
      port        = 3000
      target_port = 3000
    }
  }
}

resource "kubernetes_deployment" "api" {
  metadata {
    name      = "api"
    namespace = kubernetes_namespace.gamespace.metadata[0].name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "api"
      }
    }

    template {
      metadata {
        labels = {
          app = "api"
        }
      }

      spec {
        container {
          image = "api-image:latest"
          name  = "api"

          port {
            container_port = 4000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "api" {
  metadata {
    name      = "api-service"
    namespace = kubernetes_namespace.gamespace.metadata[0].name
  }

  spec {
    selector = {
      app = "api"
    }

    port {
      protocol    = "TCP"
      port        = 4000
      target_port = 4000
    }
  }
}
