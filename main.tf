module "eks_vpc" {
  count                     = var.enable_workflow == true ? 1 : 0
  source                    = "./aws_modules/vpc"
  vpc_cidr_block            = var.vpc_cidr_block
  tag                       = var.tag
  subnet_availability_zones = var.subnet_availability_zones
  security_group_name       = var.security_group_name
  subnet_tag                = var.subnet_tag

}

module "rds_vpc" {
  count                     = var.enable_workflow == true ? 1 : 0
  source                    = "./aws_modules/vpc"
  vpc_cidr_block            = var.rds_vpc_cidr_block
  tag                       = var.rds_tag
  subnet_availability_zones = var.subnet_availability_zones
  security_group_name       = var.rds_security_group_name
  subnet_tag                = var.rds_subnet_tag

}

module "rds" {
  count                = var.enable_workflow == true ? 1 : 0
  source               = "./aws_modules/rds"
  depends_on           = [module.rds_vpc]
  allocated_storage    = var.allocated_storage
  db_name              = var.db_name
  engine               = var.engine
  instance_class       = var.instance_class
  rds_username         = var.rds_username
  rds_password         = var.rds_password
  db_subnet_group_name = var.db_subnet_group_name
  subnet_ids           = module.rds_vpc.0.private_subnet_ids[*]
}

module "eks" {
  count                 = var.enable_workflow == true ? 1 : 0
  source                = "./aws_modules/eks"
  depends_on            = [module.eks_vpc]
  eks_iam_role_name     = var.eks_iam_role_name
  eks_cluster_name      = var.eks_cluster_name
  subnet_id_list        = flatten([module.eks_vpc.0.public_subnet_ids[*]])
  node_group_iam_name   = var.node_group_iam_name
  node_group_name       = var.node_group_name
  node_group_subnet_ids = flatten(module.eks_vpc.0.public_subnet_ids[*])
  oidc_iam_role_name    = var.oidc_iam_role_name
  namespace_name        = var.namespace_name
  service_acc_name      = var.service_acc_name
  oidc_policy_name      = var.oidc_policy_name

}
resource "null_resource" "update_config" {
  depends_on = [module.eks]
  triggers = {
    always = timestamp()
  }
  provisioner "local-exec" {
    command = <<EOT
      aws eks update-kubeconfig --region us-east-1 --name ${var.eks_cluster_name}
      cat /home/runner/.kube/config >> config.yaml
      ls -al
    EOT
  }
}

module "airflow_helm_chart" {
  count              = var.enable_workflow == true ? 1 : 0
  source             = "./helm"
  depends_on         = [null_resource.update_config]
  namespace_name     = var.namespace_name
  helm_release_name  = var.helm_release_name
  helm_repo          = var.helm_repo
  helm_chart         = var.helm_chart
  db_host            = module.rds.0.db_address
  db_port            = module.rds.0.db_port
  db_name            = module.rds.0.db_name
  db_user            = module.rds.0.db_user
  db_password        = module.rds.0.db_pass
  service_acc_name   = var.service_acc_name
  eks_oidc_arn       = module.eks.0.eks_oicd_arn
  secret_name        = var.secret_name
  pvc_name           = var.pvc_name
  storage_class_name = var.storage_class_name
  svc_name           = var.svc_name
  airflow_email      = var.airflow_email
  ingress_name       = var.ingress_name
  ebs_volume         = aws_ebs_volume.ebs_pvc.id
  rds_address        = module.rds.0.db_address


}
