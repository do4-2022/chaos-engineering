output "master_ips" {
  value = [for instance in openstack_networking_floatingip_v2.master : instance.address]
}

output "worker_ips" {
  value = [for instance in openstack_networking_floatingip_v2.worker : instance.address]
}

output "identity_application_credential" {
  value = {
    id     = openstack_identity_application_credential_v3.k0s.id
    secret = openstack_identity_application_credential_v3.k0s.secret
    region = openstack_identity_application_credential_v3.k0s.region
  }
}
