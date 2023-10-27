resource "kubernetes_service_account_v1" "service_acc" {
  metadata {
    name = var.service_acc_name
    annotations = {
      "eks.amazonaws.com/role-arn"               = var.eks_oidc_arn
      "eks.amazonaws.com/sts-regional-endpoints" = "true"
    }
  }
  secret {
    name = var.secret_name
  }
}

resource "kubernetes_secret_v1" "secret" {
  metadata {
    name = var.secret_name
    annotations = {
      "kubernetes.io/service-account.name" = var.service_acc_name
    }
  }
  type       = "kubernetes.io/service-account-token"
  depends_on = [kubernetes_service_account_v1.service_acc]
}
