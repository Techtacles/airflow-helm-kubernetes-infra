data "aws_instances" "get_instances" {
  instance_tags = {
    Role = "airflow-ng"
  }

}
