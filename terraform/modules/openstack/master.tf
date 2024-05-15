resource "openstack_compute_instance_v2" "master" {
  name            = var.openstack_instance_master_name
  image_name      = var.openstack_instance_master_image_name
  flavor_name     = var.openstack_instance_master_flavor_name
  key_pair        = openstack_compute_keypair_v2.keypair.name
  security_groups = [openstack_compute_secgroup_v2.secgroup.name]
  network {
    name = openstack_networking_network_v2.private.name
  }
}

resource "openstack_networking_floatingip_v2" "master" {
  pool = var.openstack_instance_master_floating_ip_pool
}

resource "openstack_compute_floatingip_associate_v2" "master" {
  floating_ip = openstack_networking_floatingip_v2.master.address
  instance_id = openstack_compute_instance_v2.master.id
}
