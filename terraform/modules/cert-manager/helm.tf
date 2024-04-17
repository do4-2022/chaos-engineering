resource "helm_release" "cert_manager" {
  name             = "cert-manager"
  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  namespace        = "cert-manager"
  version          = "1.12.3"
  atomic           = true
  cleanup_on_fail  = true
  create_namespace = true
  values = [
    file("${path.module}/values/values.yaml"),
    file("${path.module}/values/values.${var.environment}.yaml")
  ]
}
