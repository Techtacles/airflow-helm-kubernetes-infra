data "aws_eks_cluster_auth" "eks_auth" {
  name       = var.eks_cluster_name
  depends_on = [module.eks]
}
data "aws_eks_cluster" "cluster" {
  name       = var.eks_cluster_name
  depends_on = [module.eks]
}
data "aws_instances" "worker_nodes" {
  filter {
    name   = "image-id"
    values = ["ami-0c97930d0d19e564a"]
  }
  instance_state_names = ["running"]
}
