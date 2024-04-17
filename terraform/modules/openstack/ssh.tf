resource "openstack_compute_keypair_v2" "ssh_key_pair" {
  name       = "ssh-key-pair"
  public_key = file(var.ssh_key_path)
}
