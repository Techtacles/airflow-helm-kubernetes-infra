resource "aws_security_group" "allow_tls" {
  name       = var.security_group_name
  vpc_id     = aws_vpc.vpc.id
  depends_on = [aws_vpc.vpc]

  dynamic "ingress" {
    for_each = var.ingresses

    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      description = ingress.value.description
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }

  }

  dynamic "egress" {
    for_each = var.egresses

    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }

  }
}
