resource "aws_launch_template" "launch_template" {
  name                   = "node_group_launch_template"
  vpc_security_group_ids = var.vpc_sg_id
  image_id               = "ami-0d5cbb67678bc879c"
  
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "EKS-MANAGED-NODE"
    }
  }
}
