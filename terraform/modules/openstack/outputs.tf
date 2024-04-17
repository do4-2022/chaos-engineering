output "master_hosts" {
  description = "Master hosts"
  value       = [for i in range(var.nb_master) : openstack_networking_floatingip_v2.master_floating_ip[i].address]
}

output "worker_hosts" {
  description = "Worker hosts"
  value       = [for i in range(var.nb_worker) : openstack_networking_floatingip_v2.worker_floating_ip[i].address]
}
