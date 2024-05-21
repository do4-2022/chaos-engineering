data "openstack_networking_network_v2" "public" {
  name = "public"
}

data "openstack_networking_subnet_v2" "private_subnet" {
  name = "subnet"
}
