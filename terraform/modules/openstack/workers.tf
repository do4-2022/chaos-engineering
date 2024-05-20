resource "openstack_compute_instance_v2" "worker" {
  count = var.nb_workers

  name            = "worker-${count.index}"
  image_name      = var.worker_image_name
  flavor_name     = var.worker_flavor_name
  key_pair        = openstack_compute_keypair_v2.keypair.name
  security_groups = [openstack_networking_secgroup_v2.secgroup.name]
  network {
    name = openstack_networking_network_v2.private.name
  }
}

resource "openstack_networking_floatingip_v2" "worker" {
  count = var.nb_workers

  pool = var.worker_floating_ip_pool
}

resource "openstack_compute_floatingip_associate_v2" "worker" {
  count = var.nb_workers

  floating_ip = openstack_networking_floatingip_v2.worker[count.index].address
  instance_id = openstack_compute_instance_v2.worker[count.index].id
}
