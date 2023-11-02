resource "helm_release" "airflow_chart" {
  name         = "${var.helm_release_name}-1"
  namespace    = kubernetes_namespace.namespace.metadata[0].name
  depends_on   = [helm_release.ebs_csi_driver]
  timeout      = 2500
  wait         = false
  force_update = true

  repository = var.helm_repo
  chart      = var.helm_chart


  values = [
    templatefile("helm/values.yaml", {
      airflow_username  = "airflow"
      airflow_password  = var.db_password
      airflow_role      = "Admin"
      airflow_email     = var.airflow_email
      airflow_firstname = "Emmanuel"
      airflow_lastname  = "Offisong"
      db_user           = var.db_user
      db_password       = var.db_password
      db_host           = var.db_host
      db_name           = var.db_name
      svc_name          = var.storage_class_name

    })
  ]
}

resource "helm_release" "ebs_csi_driver" {
  name         = "csi-driver"
  namespace    = kubernetes_namespace.namespace.metadata[0].name
  timeout      = 2500
  force_update = true

  repository = "https://charts.deliveryhero.io/"
  chart      = "aws-ebs-csi-driver"
  values = [
    templatefile("helm/ebs_csi_values.yaml", {
      svc_name = var.storage_class_name

    })
  ]
}
