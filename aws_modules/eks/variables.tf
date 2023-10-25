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
variable "subnet_ids" {
    type = set(string)
}
