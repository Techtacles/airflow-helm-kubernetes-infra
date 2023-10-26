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
variable "ingresses" {
  type = list(object(
    {
      from_port   = number
      to_port     = number
      description = string
      protocol    = string
      cidr_blocks = list(any)
    }
  ))
}

variable "egresses" {
  type = list(object(
    {
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(any)
    }
  ))
}
variable "subnet_tag" {
  type = string

}

