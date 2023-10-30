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
    storage_class_name = "tst"
    volume_name        = kubernetes_persistent_volume.pv.metadata.0.name
  }
}

resource "kubernetes_persistent_volume" "pv" {
  depends_on = [ module.aws_ebs_csi_driver_resources ]
  metadata {
    name = "airflow-pv-z"
  }
  spec {
    capacity = {
      storage = "10Gi"
    }
    access_modes       = ["ReadWriteOnce"]
    storage_class_name = "tst"
    persistent_volume_source {
      csi {
        driver        = "ebs.csi.aws.com"
        volume_handle = var.ebs_volume
      }
    }
  }
}
