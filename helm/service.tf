#TO change
resource "kubernetes_service_v1" "svc" {
  metadata {
    name      = var.svc_name
    namespace = kubernetes_namespace_v1.namespace.metadata[0].name
  }
  spec {
    port {
      port        = 8080
      target_port = 8080
      node_port   = 31151
    }
    type = "NodePort"
  }
}


# #DB
# resource "kubernetes_service_v1" "db_svc" {
#   metadata {
#     name      = "${var.svc_name}-db"
#     namespace = kubernetes_namespace_v1.namespace.metadata[0].name
#   }
#   spec {
#     type          = "ExternalName"
#     external_name = var.rds_address
#   }
# }
