module "k3d" {
  source    = "../modules/k3d"
  nb_master = var.nb_master
  nb_worker = var.nb_worker
}

module "ingress_nginx" {
  depends_on = [module.k3d]
  source     = "../modules/ingress-nginx"
}
