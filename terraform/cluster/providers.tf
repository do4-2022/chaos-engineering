provider "k3d" {}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

provider "kubectl" {
  alias = "provider"
  config_path = "~/.kube/config"
  load_config_file = true
}