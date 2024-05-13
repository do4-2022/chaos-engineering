resource "kubernetes_secret" "git_credentials" {
  metadata {
    name      = "git-credentials"
    namespace = "flux-system"
  }

  data = {
    "username" = var.git_username
    "password" = var.git_password
  }

  type = "kubernetes.io/basic-auth"
}
