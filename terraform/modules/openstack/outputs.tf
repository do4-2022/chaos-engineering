output "master_ips" {
  value = [for instance in openstack_networking_floatingip_v2.master : instance.address]
}

output "worker_ips" {
  value = [for instance in openstack_networking_floatingip_v2.worker : instance.address]
}
