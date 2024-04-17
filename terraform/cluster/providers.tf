provider "k3d" {}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
