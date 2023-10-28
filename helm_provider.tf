provider "kubernetes" {
  config_path = "/home/runner/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "/home/runner/.kube/config"
  }
}
