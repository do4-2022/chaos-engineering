resource "openstack_compute_instance_v2" "master" {
  count = var.nb_masters

  name            = "master-${count.index}"
  image_name      = var.master_image_name
  flavor_name     = var.master_flavor_name
  key_pair        = openstack_compute_keypair_v2.keypair.name
  security_groups = [openstack_compute_secgroup_v2.secgroup.name]
  network {
    name = openstack_networking_network_v2.private.name
  }
}

resource "openstack_networking_floatingip_v2" "master" {
  count = var.nb_masters

  pool = var.master_floating_ip_pool
}

resource "openstack_compute_floatingip_associate_v2" "master" {
  count = var.nb_masters

  floating_ip = openstack_networking_floatingip_v2.master[count.index].address
  instance_id = openstack_compute_instance_v2.master[count.index].id
}
