locals {
  namespaces = ["votingapp", "votingapp-nats"]
}

resource "kubernetes_secret" "git_credentials" {
  for_each = toset(local.namespaces)
  metadata {
    name      = "git-credentials"
    namespace = each.value
  }

  data = {
    "username" = var.git_username
    "password" = var.git_password
  }

  type = "kubernetes.io/basic-auth"
}

resource "kubernetes_secret" "registry_credentials" {
  for_each = toset(local.namespaces)
  metadata {
    name      = "registry-credentials"
    namespace = each.value
  }

  data = {
    ".dockerconfigjson" = file(var.docker_config_path)
  }

  type = "kubernetes.io/dockerconfigjson"
}

resource "kubernetes_secret" "postgresql_credentials" {
  for_each = toset(local.namespaces)
  metadata {
    name      = "db"
    namespace = each.value
  }

  data = {
    "username" = var.postgresql_username
    "password" = var.postgresql_password
  }
}
