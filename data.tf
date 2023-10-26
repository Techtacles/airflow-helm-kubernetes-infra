data "aws_eks_cluster_auth" "eks_auth" {
  name       = module.eks.0.eks_cluster_id
  depends_on = [module.eks]
}
data "aws_eks_cluster" "cluster" {
  name       = module.eks.0.eks_cluster_id
  depends_on = [module.eks]
}
