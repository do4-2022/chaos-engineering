output "openstack_instance_master_ip" {
  value = openstack_networking_floatingip_v2.master.address
}

output "openstack_instance_worker_ip" {
  value = openstack_networking_floatingip_v2.worker.address
}
