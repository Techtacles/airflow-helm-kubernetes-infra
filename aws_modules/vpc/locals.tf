locals {
  inbound_ports  = [80, 22, 5432]
  outbound_ports = [0]
  cidr           = ["0.0.0.0/0", "0.0.0.0/0", aws_subnet.private_subnet[*].cidr_block]
}

resource "random_string" "random" {
  length = 4
  lower  = true
}
