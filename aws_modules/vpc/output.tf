output "vpc_arn" {
    value = aws_vpc.vpc.arn
  
}
output "vpc_cidr" {
    value = aws_vpc.vpc.cidr_block
  
}
output "vpc_id" {
    value = aws_vpc.vpc.id
  
}
output "subnet_id" {
    value = aws_subnet.subnet.id
  
}
output "route_table_id" {
    value = aws_vpc.vpc.main_route_table_id
  
}
