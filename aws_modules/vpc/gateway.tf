# INTERNET GATEWAY
resource "aws_internet_gateway" "i_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "internet_gateway"
  }
}

#ELASTIC IP
resource "aws_eip" "elastic_ip" {
  count      = length(var.subnet_availability_zones)
  domain     = "vpc"
  depends_on = [aws_internet_gateway.i_gateway]

  tags = {
    Name = "eip-${count.index}"
  }
}

#Modify nat gateway
resource "aws_nat_gateway" "natgw" {
  count             = length(var.subnet_availability_zones)
  subnet_id         = aws_subnet.public_subnet[count.index].id
  connectivity_type = "public"
  tags = {
    Name = "gw-NAT-${aws_subnet.public_subnet[count.index].id}"
  }
}

