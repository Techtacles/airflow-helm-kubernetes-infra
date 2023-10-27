locals {
  modify_params = [{
    name = "postgresql.enabled"
    value = "false"
  },
  {
    name = "scheduler.replicas"
    value = "2"
  },
  {
    name = "web.replicas"
    value = "2"
  },
  {
    name = "worker.replicas"
    value = "2"
  },
  {
    name = "worker.autoscaling.maxReplicas"
    value = "false"
  },
  {
    name = "triggerer.replicas"
    value = "2"
  },
  {
    name = "flower.replicas"
    value = "2"
  }]
}
