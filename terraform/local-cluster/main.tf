module "k3d" {
  source              = "../modules/k3d"
  cluster_environment = var.cluster_environment
}

module "flux" {
  source = "../modules/flux"

  cluster_environment = var.cluster_environment

  cluster_config_endpoint               = module.k3d.config_endpoint
  cluster_config_cluster_ca_certificate = module.k3d.config_cluster_ca_certificate
  cluster_config_client_certificate     = module.k3d.config_client_certificate
  cluster_config_client_key             = module.k3d.config_client_key

  git_username = var.git_username
  git_password = var.git_password
}

module "votingapp" {
  source = "../modules/votingapp"

  cluster_environment = var.cluster_environment

  cluster_config_endpoint               = module.k3d.config_endpoint
  cluster_config_cluster_ca_certificate = module.k3d.config_cluster_ca_certificate
  cluster_config_client_certificate     = module.k3d.config_client_certificate
  cluster_config_client_key             = module.k3d.config_client_key

  git_username        = var.git_username
  git_password        = var.git_password
  docker_config_path  = var.docker_config_path
  postgresql_username = var.postgresql_username
  postgresql_password = var.postgresql_password
}
