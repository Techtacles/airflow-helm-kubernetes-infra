resource "helm_release" "airflow_chart" {
  name      = "${var.helm_release_name}-5"
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
      #airflow_username  = "airflow"
      #airflow_password  = var.db_password
      #airflow_role      = "Admin"
      #airflow_email     = var.airflow_email
      #airflow_firstname = "Emmanuel"
      #airflow_lastname  = "Offisong"
      db_user     = var.db_user
      db_password = var.db_password
      db_host     = var.db_host
      db_name     = var.db_name
      pvc_name    = var.pvc_name
      svc_name    = var.storage_class_name

    })
  ]
}
