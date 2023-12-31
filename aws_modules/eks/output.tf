output "node_group_status" {
  value = aws_eks_node_group.node_group.status

}
output "node_group_arn" {
  value = aws_eks_node_group.node_group.arn

}
output "node_group_id" {
  value = aws_eks_node_group.node_group.id

}
output "eks_cluster_arn" {
  value = aws_eks_cluster.eks_cluster.arn

}
output "eks_cluster_certificate" {
  value = aws_eks_cluster.eks_cluster.certificate_authority

}
output "eks_cluster_id" {
  value = aws_eks_cluster.eks_cluster.id

}
output "eks_cluster_endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint

}
output "cluster_name" {
  value = aws_eks_cluster.eks_cluster.name

}
output "eks_oicd_arn" {
  value = aws_iam_role.oidc_iam_role.arn

}

output "cluster_sg_id" {
  value = aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id

}
