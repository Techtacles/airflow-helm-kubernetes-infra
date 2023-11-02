variable "eks_iam_role_name" {
  type = string

}
variable "eks_cluster_name" {
  type = string

}
variable "subnet_id_list" {
  type = list(string)

}
variable "node_group_iam_name" {
  type = string

}
variable "node_group_name" {
  type = string

}

variable "node_group_subnet_ids" {
  type = list(string)
}

variable "oidc_iam_role_name" {
  type = string

}
variable "namespace_name" {
  type = string
}
variable "service_acc_name" {
  type = string

}
variable "oidc_policy_name" {
  type = string

}
variable "vpc_sg_id" {
  
}
