resource "kubernetes_service_v1" "svc" {
  metadata {
    name      = var.svc_name
    namespace = kubernetes_namespace_v1.namespace.metadata[0].name
  }
  spec {
    port {
      port        = 8080
      target_port = 8080
    }
    type = "LoadBalancer"
  }
  wait_for_load_balancer = true
}
