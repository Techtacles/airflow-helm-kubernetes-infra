data "aws_instances" "get_instances" {
  instance_state_names = ["running"]

}
