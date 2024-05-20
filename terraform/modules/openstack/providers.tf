provider "openstack" {
  user_name   = var.username
  tenant_name = var.tenant_name
  password    = var.password
  auth_url    = var.auth_url
  region      = var.region
  insecure    = true
}
