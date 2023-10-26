output "vpc_arn" {
    value = aws_vpc.vpc.arn
  
}
output "vpc_cidr" {
    value = aws_vpc.vpc.cidr_block
  
}
output "vpc_id" {
    value = aws_vpc.vpc.id
  
}
output "private_subnet_id" {
    value = aws_subnet.private_subnet.0.id
  
}
output "private_subnet_ids" {
    value = aws_subnet.private_subnet[*].id
  
}
/* output "public_subnet_id" {
    value = aws_subnet.public_subnet.0.id
  
} */
output "public_subnet_ids" {
    value = aws_subnet.public_subnet[*].id
  
}
output "route_table_id" {
    value = aws_vpc.vpc.main_route_table_id
  
}
