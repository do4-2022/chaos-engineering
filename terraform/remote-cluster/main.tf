module "k0s" {
  source              = "../modules/k0s"
  master_hosts        = var.master_hosts
  worker_hosts        = var.worker_hosts
  ssh_login_name      = var.ssh_login_name
  cluster_environment = var.cluster_environment
}

locals {
  kube_config = yamldecode(module.k0s.kubeconfig)
}

module "flux" {
  source = "../modules/flux"

  cluster_environment = var.cluster_environment

  cluster_config_endpoint               = local.kube_config.clusters[0].cluster.server
  cluster_config_cluster_ca_certificate = base64decode(local.kube_config.clusters[0].cluster.certificate-authority-data)
  cluster_config_client_certificate     = base64decode(local.kube_config.users[0].user.client-certificate-data)
  cluster_config_client_key             = base64decode(local.kube_config.users[0].user.client-key-data)

  git_username = var.git_username
  git_password = var.git_password
}

module "votingapp" {
  source = "../modules/votingapp"

  cluster_config_endpoint               = local.kube_config.clusters[0].cluster.server
  cluster_config_cluster_ca_certificate = base64decode(local.kube_config.clusters[0].cluster.certificate-authority-data)
  cluster_config_client_certificate     = base64decode(local.kube_config.users[0].user.client-certificate-data)
  cluster_config_client_key             = base64decode(local.kube_config.users[0].user.client-key-data)

  git_username       = var.git_username
  git_password       = var.git_password
  docker_config_path = var.docker_config_path
}
