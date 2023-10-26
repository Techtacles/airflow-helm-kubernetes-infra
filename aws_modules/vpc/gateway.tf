resource "aws_nat_gateway" "natgw" {
  for_each          = aws_subnet.subnet[*]
  subnet_id         = each.value.id
  connectivity_type = "private"
  tags = {
    Name = "gw NAT"
  }
}
