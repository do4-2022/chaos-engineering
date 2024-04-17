resource "openstack_networking_secgroup_v2" "security_group" {
  name        = "security-group"
  description = "Security group"
}

resource "openstack_networking_secgroup_rule_v2" "security_group_rule_ssh" {
  security_group_id = openstack_networking_secgroup_v2.security_group.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
}

resource "openstack_networking_secgroup_rule_v2" "security_group_rule_kubernetes" {
  security_group_id = openstack_networking_secgroup_v2.security_group.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 6443
  port_range_max    = 6443
  remote_ip_prefix  = "0.0.0.0/0"
}

resource "openstack_networking_secgroup_rule_v2" "security_group_rule_internal" {
  security_group_id = openstack_networking_secgroup_v2.security_group.id
  direction         = "ingress"
  ethertype         = "IPv4"
  remote_group_id   = openstack_networking_secgroup_v2.security_group.id
}
