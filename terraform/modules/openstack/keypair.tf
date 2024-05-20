resource "openstack_compute_keypair_v2" "keypair" {
  name       = "keypair"
  public_key = file(var.ssh_public_key_path)
}
