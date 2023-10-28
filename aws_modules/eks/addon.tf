
resource "aws_eks_addon" "addon" {
  depends_on   = [aws_eks_cluster.eks_cluster]
  cluster_name = aws_eks_cluster.eks_cluster.name
  addon_name   = "aws-ebs-csi-driver"
}
