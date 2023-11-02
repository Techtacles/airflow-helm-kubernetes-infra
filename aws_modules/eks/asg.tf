resource "aws_autoscaling_group_tag" "nodes_group" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.node_group.resources : resources.autoscaling_groups]
    ) : asg.name]
  )

  autoscaling_group_name = each.value

  tag {
    key   = "Name"
    value = "EKS_MANAGED-NODE"
    propagate_at_launch = true
  }
}
