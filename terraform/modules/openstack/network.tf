resource "openstack_networking_network_v2" "private" {
  name           = "private"
  admin_state_up = "true"
}

data "openstack_networking_network_v2" "public" {
  name = "public"
}

resource "openstack_networking_subnet_v2" "private" {
  name            = "subnet"
  network_id      = openstack_networking_network_v2.private.id
  cidr            = "192.168.0.0/24"
  ip_version      = 4
  dns_nameservers = ["10.0.0.3", "8.8.8.8", "8.8.4.4"]
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

resource "openstack_networking_secgroup_v2" "secgroup" {
  name        = "security-group"
  description = "A security group"
}

resource "openstack_networking_secgroup_rule_v2" "security_group_rule_ssh" {
  security_group_id = openstack_networking_secgroup_v2.secgroup.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
}

resource "openstack_networking_secgroup_rule_v2" "security_group_rule_kubernetes" {
  security_group_id = openstack_networking_secgroup_v2.secgroup.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 6443
  port_range_max    = 6443
  remote_ip_prefix  = "0.0.0.0/0"
}

resource "openstack_networking_secgroup_rule_v2" "security_group_rule_internal" {
  security_group_id = openstack_networking_secgroup_v2.secgroup.id
  direction         = "ingress"
  ethertype         = "IPv4"
  remote_group_id   = openstack_networking_secgroup_v2.secgroup.id
}

