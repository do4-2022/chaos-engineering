resource "kubernetes_manifest" "letsencrypt_cluster_issuer" {
  depends_on = [helm_release.cert_manager]

  manifest = {
    apiVersion = "cert-manager.io/v1"
    kind       = "ClusterIssuer"
    metadata = {
      name = "letsencrypt"
    }

    spec = {
      acme = {
        server = "https://acme-v02.api.letsencrypt.org/directory"
        email  = var.dns_email
        privateKeySecretRef = {
          name = "letsencrypt-key"
        }
        solvers = [
          {
            http01 = {
              ingress = {
                ingressClassName = "nginx"
              }
            }
          }
        ]
      }
    }
  }
}
