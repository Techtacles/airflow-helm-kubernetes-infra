resource "aws_subnet" "subnet" {
  count             = length(var.subnet_availability_zones)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 8, count.index)
  availability_zone = var.subnet_availability_zones[count.index]
  tags = {
    Name = "${var.subnet_tag}_${count.index}"
  }
  depends_on = [aws_vpc.vpc]
}
