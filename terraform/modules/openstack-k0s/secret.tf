locals {
  namespaces = ["kube-system", "openstack-cloud-controller"]
}

resource "kubernetes_secret" "os_cloud_credentials" {
  for_each = toset(local.namespaces)

  metadata {
    name      = "os-cloud-credentials"
    namespace = each.value
  }

  data = {
    "cloud.conf" = <<EOF
[Global]
auth-url = ${var.openstack_auth_url}
application-credential-id = ${openstack_identity_application_credential_v3.k0s.id}
application-credential-secret = ${openstack_identity_application_credential_v3.k0s.secret}
region = ${openstack_identity_application_credential_v3.k0s.region}
tls-insecure = true

[LoadBalancer]
use-octavia=true
floating-network-id=${data.openstack_networking_network_v2.public.id}
subnet-id=${data.openstack_networking_subnet_v2.private_subnet.id}
EOF
  }
}
