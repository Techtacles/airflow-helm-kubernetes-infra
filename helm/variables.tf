
variable "namespace_name" {
  type = string

}
variable "helm_release_name" {
  type = string

}
variable "helm_repo" {
  type = string

}
variable "helm_chart" {
  type = string
}
/* variable "chart_params" {
  type = list(object({
    name  = string
    value = string
    type  = string
  }))

} */
variable "db_host" {
  type = string

}
variable "db_port" {
  type = number

}
variable "db_name" {
  type = string

}
variable "db_user" {
  type = string

}
variable "db_password" {
  type = string

}
variable "service_acc_name" {
  type = string

}
variable "eks_oidc_arn" {
  type = string

}
variable "secret_name" {
  type = string

}
variable "ingress_name" {
  type = string

}
variable "svc_name" {
  type = string

}
variable "pvc_name" {
  type = string

}
variable "storage_class_name" {
  type = string

}
variable "airflow_email" {
  type = string

}
variable "ebs_volume" {
  type = string

}
variable "rds_address" {
  type = string

}
variable "eks_cluster_name" {
  type = string

}
