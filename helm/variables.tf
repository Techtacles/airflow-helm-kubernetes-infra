
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
variable "chart_params" {
  type = list(object({
    name  = string
    value = string
    type  = string
  }))

}
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
