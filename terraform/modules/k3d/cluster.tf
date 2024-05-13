resource "k3d_cluster" "votingapp" {
  name    = "votingapp-${var.cluster_environment}"
  servers = var.nb_masters
  agents  = var.nb_workers

  k3s {
    extra_args {
      arg          = "--disable=traefik"
      node_filters = ["servers:*"]
    }
  }

  kubeconfig {
    update_default_kubeconfig = true
    switch_current_context    = true
  }

  port {
    host_port      = 80
    container_port = 80
    node_filters = [
      "loadbalancer",
    ]
  }

  port {
    host_port      = 443
    container_port = 443
    node_filters = [
      "loadbalancer",
    ]
  }
}
