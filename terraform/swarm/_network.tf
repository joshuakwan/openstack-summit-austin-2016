resource "openstack_networking_network_v2" "atx2016" {
  name = "network_${var.cluster_name}"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "atx2016" {
  name = "subnet_${var.cluster_name}"
  network_id = "${openstack_networking_network_v2.atx2016.id}"
  cidr = "192.168.199.0/24"
  ip_version = 4
}

resource "openstack_networking_router_v2" "atx2016" {
  region = "RegionOne"
  name = "router_${var.cluster_name}"
  external_gateway = "${var.external_gateway}"
}

resource "openstack_networking_router_interface_v2" "atx2016" {
  region = "RegionOne"
  router_id = "${openstack_networking_router_v2.atx2016.id}"
  subnet_id = "${openstack_networking_subnet_v2.atx2016.id}"
}