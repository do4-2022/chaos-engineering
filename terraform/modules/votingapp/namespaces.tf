resource "kubernetes_namespace" "votingapp" {
  metadata {
    name = "votingapp"
    annotations = {
      "chaos-mesh.org/inject" = "enabled"
    }
  }
}

resource "kubernetes_namespace" "votingapp_nats" {
  metadata {
    name = "votingapp-nats"
    annotations = {
      "chaos-mesh.org/inject" = "enabled"
    }
  }
}

resource "kubernetes_namespace" "cert_manager" {
  metadata {
    name = "cert-manager"
  }
}

resource "kubernetes_namespace" "ingress_nginx" {
  metadata {
    name = "ingress-nginx"
  }
}

resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
}

resource "kubernetes_namespace" "metal_lb" {
  count = var.cluster_environment == "production" ? 1 : 0
  metadata {
    name = "metallb-system"
  }
}

resource "kubernetes_namespace" "openstack_cloud_controller" {
  count = var.cluster_environment == "production" ? 1 : 0
  metadata {
    name = "openstack-cloud-controller"
  }
}

resource "kubernetes_namespace" "chaos_mesh" {
  metadata {
    name = "chaos-mesh"
  }
}

resource "kubernetes_namespace" "chaos" {
  metadata {
    name = "chaos"
  }
}
