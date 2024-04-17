terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "1.53.0"
    }

    k0s = {
      source  = "alessiodionisi/k0s"
      version = "0.2.2"
    }
  }
}
