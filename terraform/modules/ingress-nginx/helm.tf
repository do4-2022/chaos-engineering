resource "helm_release" "ingress_nginx" {
  name             = "ingress-nginx"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = "ingress-nginx"
  version          = "4.7.1"
  atomic           = true
  cleanup_on_fail  = true
  create_namespace = true
  values = [
    file("${path.module}/values/values.yaml"),
  ]
}
