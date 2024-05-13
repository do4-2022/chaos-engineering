resource "kubernetes_namespace" "flux_system" {
  metadata {
    name = "flux-system"
  }
}
