variable "allocated_storage" {
  type = string

}
variable "db_name" {
  type = string

}
variable "engine" {
  type = string

}

variable "instance_class" {
  type = string

}
variable "rds_username" {
  type = string

}
variable "rds_password" {
  type = string

}

variable "db_subnet_group_name" {
  type = string

}
variable "subnet_ids" {
  type = list(string)

}
variable "vpc_id" {
  type = string

}
