provider "kubernetes" {
  host                   = var.enable_workflow == true ? module.eks.0.eks_cluster_endpoint : null
  cluster_ca_certificate = base64decode(var.enable_workflow == true ? module.eks.0.eks_cluster_certificate.0.data : null)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", var.enable_workflow == true ? module.eks.0.cluster_name : null]
    command     = "aws"
  }
}
provider "helm" {
  kubernetes {
    host                   = var.enable_workflow == true ? module.eks.0.eks_cluster_endpoint : null
    cluster_ca_certificate = base64decode(var.enable_workflow == true ? module.eks.0.eks_cluster_certificate.0.data : null)

  }
}
