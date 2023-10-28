# resource "helm_release" "ebs_csi_driver" {
#   name       = "aws-ebs-csi-driver"
#   namespace  = var.namespace_name
#   repository = "https://kubernetes-sigs.github.io/aws-ebs-csi-driver"
#   chart      = "aws-ebs-csi-driver"

#   set {
#     name  = "controller.serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
#     type  = "string"
#     value = var.eks_oidc_arn
#   }
# }
