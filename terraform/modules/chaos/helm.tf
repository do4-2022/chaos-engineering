resource "helm_release" "litmus" {
  repository = "https://litmuschaos.github.io/litmus-helm/"
  chart = "litmus"
  name = "litmus"
  namespace = "litmus"
  atomic = true
  cleanup_on_fail = true
  create_namespace = true   

  values = [
    file("${path.module}/values/values.yaml")
  ]

  set_sensitive {
    name = "adminConfig.ADMIN_PASSWORD"
    value = var.litmus_admin_pwd
  }

}