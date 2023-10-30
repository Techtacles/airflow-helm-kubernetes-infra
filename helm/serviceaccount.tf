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
  for_each = data.aws_instances.get_instances.private_ips
  metadata {
    name = "role-binding"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }
  subject {
    kind      = "User"
    name      = "system:node:ip-${replace(each.value,"-",".")}.ec2.internal"
    api_group = "rbac.authorization.k8s.io"
  }
  subject {
    kind      = "ServiceAccount"
    name      = var.service_acc_name
    namespace = kubernetes_namespace.namespace.metadata[0].name
  }
  subject {
    kind      = "Group"
    name      = "system:node"
    api_group = "rbac.authorization.k8s.io"
  }
}
