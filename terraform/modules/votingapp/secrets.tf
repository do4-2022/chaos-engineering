resource "kubernetes_secret" "git_credentials" {
  metadata {
    name      = "git-credentials"
    namespace = "votingapp"
  }

  data = {
    "username" = var.git_username
    "password" = var.git_password
  }

  type = "kubernetes.io/basic-auth"
}

resource "kubernetes_secret" "registry_credentials" {
  metadata {
    name      = "registry-credentials"
    namespace = "votingapp"
  }

  data = {
    ".dockerconfigjson" = file(var.docker_config_path)
  }

  type = "kubernetes.io/dockerconfigjson"
}
