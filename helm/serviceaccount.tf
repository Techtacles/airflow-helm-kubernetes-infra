resource "kubernetes_service_account_v1" "service_acc" {
  metadata {
    name      = var.service_acc_name
    namespace = kubernetes_namespace.namespace.metadata[0].name
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
    name      = var.secret_name
    namespace = kubernetes_namespace.namespace.metadata[0].name
    annotations = {
      "kubernetes.io/service-account.name" = var.service_acc_name
    }
  }
  type       = "kubernetes.io/service-account-token"
  depends_on = [kubernetes_service_account_v1.service_acc]
}

resource "kubernetes_cluster_role" "clusterrole" {
  metadata {
    name = "airflow-cluster-role"
  }

  rule {
    api_groups = [""]
    resources  = ["namespaces", "pods"]
    verbs      = ["get", "list", "watch"]
  }
}

resource "kubernetes_cluster_role_binding" "rolebinding" {
  metadata {
    name = "role-binding"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "airflow-cluster-role"
  }

  subject {
    kind      = "ServiceAccount"
    name      = var.service_acc_name
    namespace = kubernetes_namespace.namespace.metadata[0].name
  }
  subject {
    kind      = "Group"
    name      = "system:authenticated"
    api_group = "rbac.authorization.k8s.io"
  }
  subject {
    kind      = "Group"
    name      = "system:unauthenticated"
    api_group = "rbac.authorization.k8s.io"
  }
}
