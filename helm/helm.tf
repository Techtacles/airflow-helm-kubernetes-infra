resource "helm_release" "airflow_chart" {
  name             = var.helm_release_name
  namespace        = kubernetes_namespace_v1.namespace.metadata[0].name
  #create_namespace = true
  timeout          = 1500
  force_update     = true

  repository = var.helm_repo
  chart      = var.helm_chart


   values = [
    templatefile("./values.yaml", { 
      db_host = var.db_host
      db_port = var.db_port
      db_schema = "airflow-schema"
      db_user = var.db_user
      db_password = var.db_password
      airflow_username = "airflow"
      airflow_password = var.db_password
      airflow_role = "Admin"
      airflow_email = var.airflow_email
      airflow_firstname = "Emmanuel"
      airflow_lastname = "Offisong"
      lb_host = kubernetes_service_v1.svc.status.0.load_balancer.0.ingress.0.hostname
      secret_name = var.secret_name
      service_account_name = var.service_acc_name
      eks_oidc_arn = var.eks_oidc_arn
      storage_class = var.storage_class_name
      
     })
  ]
}
