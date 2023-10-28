locals {
  modify_params = [{
    name = "postgresql.enabled"
    value = "false"
  },
  {
    name = "scheduler.replicas"
    value = "1"
  },
  {
    name = "web.replicas"
    value = "1"
  },
  {
    name = "worker.replicas"
    value = "1"
  },
  {
    name = "worker.autoscaling.maxReplicas"
    value = "2"
  },
  {
    name = "triggerer.replicas"
    value = "1"
  },
  {
    name = "flower.replicas"
    value = "1"
  }]
}
