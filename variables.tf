variable "enable_workflow" {
  type        = bool
  default     = false
  description = "This is a toggle to enable or disable the whole workflow"

}

#EKS VPC MODULE
variable "vpc_cidr_block" {
  type = string

}
variable "tag" {
  type = string

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

#RDS VPC MODULE
variable "rds_vpc_cidr_block" {
  type = string

}
variable "rds_tag" {
  type = string

}
variable "subnet_availability_zones" {
  type = list(string)

}
variable "rds_security_group_name" {
  type = string

}
variable "rds_ingresses" {
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

variable "rds_egresses" {
  type = list(object(
    {
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(any)
    }
  ))
}
variable "rds_subnet_tag" {
  type = string

}
#RDS DB
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

#EKS Cluster
variable "eks_iam_role_name" {
  type = string

}
variable "eks_cluster_name" {
  type = string

}
variable "node_group_iam_name" {
  type = string

}
variable "node_group_name" {
  type = string

}

#HELM



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
  }))

}
