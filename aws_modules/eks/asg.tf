resource "aws_autoscaling_group_tag" "asg" {    
  autoscaling_group_name = aws_eks_node_group.node_group.resources[0].autoscaling_groups[0].name

  tag {
    key   = "Name"
    value = "EKS-MANAGED-GROUP"

    propagate_at_launch = true
  }

  depends_on = [
    aws_eks_node_group.node_group
  ]
}
