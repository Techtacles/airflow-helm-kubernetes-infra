locals {
  inbound_ports = [{
    name  = 80,
    cidr = ["0.0.0.0/0"]
    },
    {
      name  = 22,
      cidr = ["0.0.0.0/0"]
    },
    {
      name  = 5432,
      cidr = flatten(aws_subnet.private_subnet[*].cidr_block)
  }]
  outbound_ports = [0]
}

resource "random_string" "random" {
  length = 4
  lower  = true
}
