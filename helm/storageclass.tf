resource "kubernetes_storage_class_v1" "storage_class" {
  #depends_on = [helm_release.ebs_csi_driver]
  metadata {
    name = var.storage_class_name

  }
  storage_provisioner = "kubernetes.io/aws-ebs"
  reclaim_policy      = "Delete"
  parameters = {
    type    = "gp2"
    fs_type = "ext4"
  }
}
