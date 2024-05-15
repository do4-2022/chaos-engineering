resource "openstack_networking_network_v2" "private" {
  name           = "private"
  admin_state_up = "true"
}

data "openstack_networking_network_v2" "public" {
  name = "public"
}

resource "openstack_networking_subnet_v2" "private" {
  name       = "subnet"
  network_id = openstack_networking_network_v2.private.id
  cidr       = "192.168.0.0/24"
  ip_version = 4
}

resource "openstack_networking_router_v2" "router" {
  name                = "router"
  admin_state_up      = "true"
  external_network_id = data.openstack_networking_network_v2.public.id
}

resource "openstack_networking_router_interface_v2" "private_interface" {
  router_id = openstack_networking_router_v2.router.id
  subnet_id = openstack_networking_subnet_v2.private.id
}

resource "openstack_compute_secgroup_v2" "secgroup" {
  name        = "secgroup"
  description = "A security group"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = 6443
    to_port     = 6443
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}

resource "openstack_networking_secgroup_rule_v2" "allow_internal" {
  security_group_id = openstack_compute_secgroup_v2.secgroup.id
  direction         = "ingress"
  ethertype         = "IPv4"
  remote_group_id   = openstack_compute_secgroup_v2.secgroup.id
}
