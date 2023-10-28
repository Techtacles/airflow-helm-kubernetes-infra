resource "kubernetes_persistent_volume_claim_v1" "pvc" {
  depends_on = [kubernetes_persistent_volume_v1.pv]
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

/* resource "kubernetes_persistent_volume_v1" "pv" {
  metadata {
    name = "airflow-pv"
  }
  spec {
    capacity = {
      storage = "10Gi"
    }
    storage_class_name = var.storage_class_name
    access_modes       = ["ReadWriteMany"]
    persistent_volume_source {
      aws_elastic_block_store {
        volume_id = var.ebs_volume
      }
    }
  }
} */
