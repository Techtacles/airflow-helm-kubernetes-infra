resource "kubernetes_persistent_volume_claim_v1" "pvc" {
  depends_on = [kubernetes_persistent_volume_v1.pv]
  metadata {
    name      = var.pvc_name
    namespace = kubernetes_namespace_v1.namespace.metadata[0].name
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "5Gi"
      }
    }
    #storage_class_name = var.storage_class_name
    volume_name = kubernetes_persistent_volume_v1.pv.metadata.0.name
  }
}

resource "kubernetes_persistent_volume_v1" "pv" {
  metadata {
    name = "airflow-pv"
  }
  spec {
    capacity = {
      storage = "5Gi"
    }
    #storage_class_name = var.storage_class_name
    access_modes = ["ReadWriteOnce"]
    persistent_volume_source {
      csi {
        driver        = "ebs.csi.aws.com"
        volume_handle = var.ebs_volume
      }
    }
  }
}
