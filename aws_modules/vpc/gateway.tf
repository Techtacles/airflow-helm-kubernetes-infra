resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.subnet.0.id
  depends_on    = [aws_internet_gateway.gw]
  tags = {
    Name = "gw NAT"
  }
}
