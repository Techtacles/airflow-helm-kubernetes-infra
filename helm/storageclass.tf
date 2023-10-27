resource "kubernetes_storage_class_v1" "storage_class" {
  metadata {
    name = var.storage_class_name
  }
  storage_provisioner = "kubernetes.io/aws-ebs"
  reclaim_policy      = "Retain"
  parameters = {
    type      = "io1"
    iopsPerGB = "5"
  }
}
