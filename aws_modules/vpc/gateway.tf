resource "aws_nat_gateway" "natgw" {
  subnet_id         = aws_subnet.subnet.0.id
  connectivity_type = "private"
  tags = {
    Name = "gw NAT"
  }
}
