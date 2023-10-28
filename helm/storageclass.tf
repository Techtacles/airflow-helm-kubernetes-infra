# resource "kubernetes_storage_class_v1" "storage_class" {
#   depends_on = [helm_release.ebs_csi_driver]
#   metadata {
#     name = var.storage_class_name
#     annotations = {
#       "storageclass.kubernetes.io/is-default-class" = "true"
#     }
#   }
#   storage_provisioner = "ebs.csi.aws.com"
#   reclaim_policy      = "Delete"
#   parameters = {
#     type = "gp2"
#   }
# }
