module "openstack" {
  source = "../modules/openstack"

  username            = var.openstack_username
  tenant_name         = var.openstack_tenant_name
  password            = var.openstack_password
  auth_url            = var.openstack_auth_url
  region              = var.openstack_region
  ssh_public_key_path = var.openstack_ssh_public_key_path

  nb_masters = var.nb_masters
  nb_workers = var.nb_workers
}

module "k0s" {
  source               = "../modules/k0s"
  master_hosts         = module.openstack.master_ips
  worker_hosts         = module.openstack.worker_ips
  ssh_login_name       = var.ssh_login_name
  cluster_environment  = var.cluster_environment
  ssh_private_key_path = var.openstack_ssh_private_key_path
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

  git_username        = var.git_username
  git_password        = var.git_password
  docker_config_path  = var.docker_config_path
  postgresql_username = var.postgresql_username
  postgresql_password = var.postgresql_password
}
