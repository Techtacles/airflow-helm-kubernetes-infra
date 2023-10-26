#PRIVATE ROUTE TABLE
resource "aws_route_table" "route_table" {
  count  = length(var.subnet_availability_zones)
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.natgw[count.index].id
  }


  tags = {
    Name = "route_subnet_gw_private"
  }
}

resource "aws_route_table_association" "route_subnet_association" {
  count          = length(var.subnet_availability_zones)
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.route_table[count.index].id
}


#PUBLIC ROUTE TABLE
resource "aws_route_table" "route_table_public" {
  count  = length(var.subnet_availability_zones)
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.i_gateway.id
  }


  tags = {
    Name = "route_subnet_gw_public_${count.index}"
  }
}

resource "aws_route_table_association" "route_public_subnet_association" {
  count          = length(var.subnet_availability_zones)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.route_table_public[count.index].id
}
