resource "aws_db_instance" "db_instance" {
  allocated_storage      = var.allocated_storage
  db_name                = var.db_name
  engine                 = var.engine
  instance_class         = var.instance_class
  username               = var.rds_username
  password               = var.rds_password
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  skip_final_snapshot    = true
  publicly_accessible    = true
  identifier             = "airflow-db"
  vpc_security_group_ids = [aws_security_group.allow_rds_conn.id]
  depends_on             = [aws_security_group.allow_rds_conn]
}

resource "aws_security_group" "allow_rds_conn" {
  name        = "allow_rds_connection"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "TLS from VPC"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


}
