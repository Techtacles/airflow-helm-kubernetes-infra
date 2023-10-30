resource "kubernetes_persistent_volume_claim" "pvc" {
  depends_on = [kubernetes_persistent_volume.pv]
  metadata {
    name      = var.pvc_name
    namespace = kubernetes_namespace.namespace.metadata[0].name
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "10Gi"
      }
    }
    storage_class_name = var.storage_class_name
    volume_name        = kubernetes_persistent_volume_v1.pv.metadata.0.name
  }
}

resource "kubernetes_persistent_volume_v1" "pv" {
  metadata {
    name = "airflow-pv"
  }
  spec {
    capacity = {
      storage = "10Gi"
    }
    access_modes       = ["ReadWriteOnce"]
    storage_class_name = var.storage_class_name
    persistent_volume_source {
      aws_elastic_block_store {
        volume_id = var.ebs_volume
      }
    }
  }
}
