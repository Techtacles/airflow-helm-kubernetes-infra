resource "kubernetes_ingress" "ingress" {
  depends_on = [kubernetes_service_v1.svc]
  metadata {
    name      = var.ingress_name
    namespace = kubernetes_namespace_v1.namespace.metadata[0].name
    annotations = {
      "alb.ingress.kubernetes.io/scheme" = "internet-facing"
    }
  }

  spec {
    backend {
      service_name = var.svc_name
      service_port = 8080
    }

    rule {
      http {
        path {
          backend {
            service_name = var.svc_name
            service_port = 8080
          }

          path = "/"
        }

      }
    }

    tls {
      secret_name = var.secret_name
    }
  }
}
