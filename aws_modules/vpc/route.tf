resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.natgw.id
  }


  tags = {
    Name = "route_subnet_gw"
  }
}

resource "aws_route_table_association" "route_subnet_association" {
  subnet_id      = aws_subnet.subnet.0.id
  route_table_id = aws_route_table.route_table.id
}
