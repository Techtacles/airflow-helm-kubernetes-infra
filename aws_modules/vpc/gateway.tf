resource "aws_nat_gateway" "natgw" {
  subnet_id     = aws_subnet.subnet.0.id
  tags = {
    Name = "gw NAT"
  }
}
