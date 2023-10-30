resource "helm_release" "airflow_chart" {
  name      = "${var.helm_release_name}-1"
  namespace = kubernetes_namespace.namespace.metadata[0].name
  #create_namespace = true
  timeout      = 2500
  force_update = true

  repository = var.helm_repo
  chart      = var.helm_chart
  /* dynamic "set" {
    for_each = local.modify_params
    content {
      name  = set.value.name
      value = set.value.value
    }

  } */

  values = [
    templatefile("helm/values.yaml", {
      svc_name          = var.storage_class_name

    })
  ]
}
