resource "aws_db_instance" "db_instance" {
  allocated_storage    = var.allocated_storage
  db_name              = var.db_name
  engine               = var.engine
  instance_class       = var.instance_class
  username             = var.rds_username
  password             = var.rds_password
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  skip_final_snapshot  = true
}
