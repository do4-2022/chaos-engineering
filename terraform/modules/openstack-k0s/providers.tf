provider "kubernetes" {
  host                   = var.cluster_config_endpoint
  client_certificate     = var.cluster_config_client_certificate
  client_key             = var.cluster_config_client_key
  cluster_ca_certificate = var.cluster_config_cluster_ca_certificate
}

provider "openstack" {
  user_name   = var.openstack_username
  tenant_name = var.openstack_tenant_name
  password    = var.openstack_password
  auth_url    = var.openstack_auth_url
  region      = var.openstack_region
  insecure    = true
}
