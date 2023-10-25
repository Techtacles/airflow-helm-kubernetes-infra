output "db_arn" {
    value = aws_db_instance.db_instance.arn
  
}
output "db_address" {
  value = aws_db_instance.db_instance.address
}
output "db_name" {
    value = aws_db_instance.db_instance.db_name
  
}
output "db_endpoint" {
    value = aws_db_instance.db_instance.endpoint
  
}
output "db_port" {
    value = aws_db_instance.db_instance.port
  
}
output "db_user" {
    value = aws_db_instance.db_instance.username
  
}
output "db_pass" {
    value = aws_db_instance.db_instance.password
  
}
