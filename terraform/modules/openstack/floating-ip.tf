resource "openstack_networking_floatingip_v2" "master_floating_ip" {
  count = var.nb_master
  pool  = var.public_network_name
}

resource "openstack_compute_floatingip_associate_v2" "master_floating_ip_association" {
  count       = var.nb_master
  floating_ip = openstack_networking_floatingip_v2.master_floating_ip[count.index].address
  instance_id = openstack_compute_instance_v2.master[count.index].id
}

resource "openstack_networking_floatingip_v2" "worker_floating_ip" {
  count = var.nb_worker
  pool  = var.public_network_name
}

resource "openstack_compute_floatingip_associate_v2" "worker_floating_ip_association" {
  count       = var.nb_worker
  floating_ip = openstack_networking_floatingip_v2.worker_floating_ip[count.index].address
  instance_id = openstack_compute_instance_v2.worker[count.index].id
}

