resource "openstack_compute_keypair_v2" "keypair" {
  name       = var.openstack_instances_keypair_name
  public_key = file(var.openstack_instances_keypair_public_key)
}
