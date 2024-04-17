resource "helm_release" "kube_prometheus_stack" {
  name             = "kube-prometheus-stack"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  namespace        = "monitoring"
  version          = "58.1.3"
  create_namespace = true
  atomic           = true
  cleanup_on_fail  = true
  values = [
    file("${path.module}/values/values.yaml"),
  ]
}
