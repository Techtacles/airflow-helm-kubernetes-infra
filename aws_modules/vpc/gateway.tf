resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "IG"
  }
}
resource "aws_eip" "lb" {
  depends_on = [aws_internet_gateway.gw]
  domain        = "vpc"
}


resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.subnet.id
  depends_on    = [aws_internet_gateway.gw]
  tags = {
    Name = "gw NAT"
  }
}
