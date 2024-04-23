terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      configuration_aliases = [ kubectl.provider ]
    }
  }
}