resource "openstack_compute_instance_v2" "worker" {
  name            = var.openstack_instance_worker_name
  image_name      = var.openstack_instance_worker_image_name
  flavor_name     = var.openstack_instance_worker_flavor_name
  key_pair        = openstack_compute_keypair_v2.keypair.name
  security_groups = [openstack_compute_secgroup_v2.secgroup.name]
  network {
    name = openstack_networking_network_v2.private.name
  }
}

resource "openstack_networking_floatingip_v2" "worker" {
  pool = var.openstack_instance_worker_floating_ip_pool
}

resource "openstack_compute_floatingip_associate_v2" "worker" {
  floating_ip = openstack_networking_floatingip_v2.worker.address
  instance_id = openstack_compute_instance_v2.worker.id
}
