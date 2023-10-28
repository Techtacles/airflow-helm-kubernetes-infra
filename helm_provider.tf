provider "kubernetes" {
  config_path = "/home/runner/work/airflow-kafka-kubernetes-infra/airflow-kafka-kubernetes-infra/config.yaml"
}

provider "helm" {
  kubernetes {
    config_path = "/home/runner/work/airflow-kafka-kubernetes-infra/airflow-kafka-kubernetes-infra/config.yaml"
  }
}
