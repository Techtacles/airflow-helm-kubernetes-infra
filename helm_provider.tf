provider "kubernetes" {
  config_path = "config.yaml"
}

provider "helm" {
  kubernetes {
    config_path = "config.yaml"
  }
}
