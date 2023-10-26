resource "kubernetes_secret_v1" "service_acc" {
  metadata {
    annotations = {
      "kubernetes.io/service-account.name" = "my-service-account"
    }
  }

  type = "kubernetes.io/service-account-token"
}
