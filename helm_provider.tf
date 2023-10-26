provider "kubernetes" {
  host                   = module.eks.0.eks_cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.0.eks_cluster_certificate.0.data)
  token                  = data.aws_eks_cluster_auth.eks_auth.token
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", module.eks.0.cluster_name]
    command     = "aws"
  }
  experiments {
    manifest_resource = true
  }
}
provider "helm" {
  kubernetes {
    host                   = module.eks.0.eks_cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.0.eks_cluster_certificate.0.data)
    token                  = data.aws_eks_cluster_auth.eks_auth.token

  }
}
