resource "aws_nat_gateway" "natgw" {
  for_each          = toset(aws_subnet.subnet[*].id)
  subnet_id         = each.value.id
  connectivity_type = "private"
  tags = {
    Name = "gw NAT"
  }
}
