resource "openstack_identity_application_credential_v3" "k0s" {
  name  = "k0s-cloud-credentials"
  roles = ["reader", "member", "load-balancer_member"]
}
