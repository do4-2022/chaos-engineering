resource "kubernetes_namespace" "metal_lb" {
  metadata {
    name = "metallb-system"
  }
}

resource "kubernetes_namespace" "openstack_cloud_controller" {
  metadata {
    name = "openstack-cloud-controller"
  }
}
