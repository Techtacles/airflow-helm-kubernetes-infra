variable "vpc_cidr_block" {
  type = string

}
variable "tag" {
  type = string

}
variable "subnet_availability_zones" {
  type = list(string)

}
variable "security_group_name" {
  type = string

}

variable "subnet_tag" {
  type = string

}

