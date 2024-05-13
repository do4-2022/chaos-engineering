resource "helm_release" "flux" {
  name            = "flux2"
  repository      = "https://fluxcd-community.github.io/helm-charts"
  chart           = "flux2"
  namespace       = "flux-system"
  version         = "2.12.4"
  wait            = true
  atomic          = true
  cleanup_on_fail = true
}

resource "helm_release" "flux_sync" {
  depends_on      = [helm_release.flux]
  name            = "NATS-Julien-Yann-AlexisB"
  repository      = "https://fluxcd-community.github.io/helm-charts"
  chart           = "flux2-sync"
  namespace       = "flux-system"
  version         = "1.8.2"
  wait            = true
  atomic          = true
  cleanup_on_fail = true

  values = [file("${path.module}/values/flux-sync.yaml")]

  set {
    name  = "kustomization.spec.path"
    value = "clusters/${var.cluster_environment}"
  }
}
