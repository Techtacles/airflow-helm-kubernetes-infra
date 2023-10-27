resource "kubernetes_persistent_volume_claim" "example" {
  depends_on = [kubernetes_storage_class_v1.storage_class]
  metadata {
    name      = var.pvc_name
    namespace = kubernetes_namespace_v1.namespace.metadata[0].name
  }
  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "5Gi"
      }
    }
    storage_class_name = var.storage_class_name
  }
}
