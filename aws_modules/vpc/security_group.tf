locals {
  inbound_ports  = [80, 22]
  outbound_ports = [0]
}

resource "aws_security_group" "allow_tls" {
  name        = var.security_group_name
  vpc_id      = aws_vpc.vpc.id
  description = "Security group for subnets"
  depends_on  = [aws_vpc.vpc]

  dynamic "ingress" {
    for_each = local.inbound_ports

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }

  dynamic "egress" {
    for_each = local.outbound_ports

    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }
}
