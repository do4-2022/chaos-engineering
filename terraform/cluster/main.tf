module "openstack" {
  source       = "../modules/openstack"
  nb_master    = var.nb_master
  nb_worker    = var.nb_worker
  ssh_key_path = var.ssh_public_key_path
}

module "k0s" {
  source          = "../modules/k0s"
  ssh_key_path    = var.ssh_private_key_path
  master_hosts    = module.openstack.master_hosts
  worker_hosts    = module.openstack.worker_hosts
  kubeconfig_path = var.kubeconfig_path
}
