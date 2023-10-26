data "aws_eks_cluster_auth" "eks_auth" {
  name = var.eks_cluster_name
}
