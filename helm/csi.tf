module "aws_ebs_csi_driver_iam" {
  source                = "github.com/andreswebs/terraform-aws-eks-ebs-csi-driver//modules/iam"
  cluster_oidc_provider = var.eks_oidc_arn
  k8s_namespace         = var.namespace_name
  iam_role_name         = "ebs-csi-controller-role"
}

module "aws_ebs_csi_driver_resources" {
  depends_on   = [module.aws_ebs_csi_driver_iam]
  source       = "github.com/andreswebs/terraform-aws-eks-ebs-csi-driver//modules/resources"
  cluster_name = var.eks_cluster_name
  iam_role_arn = module.aws_ebs_csi_driver_iam.role.arn
}
