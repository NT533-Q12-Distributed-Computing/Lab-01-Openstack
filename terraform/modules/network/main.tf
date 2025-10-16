terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.54"
    }
  }
}

# Network: local
resource "openstack_networking_network_v2" "local" {
  name           = "${var.prefix}_local"
  admin_state_up = true
}

resource "openstack_networking_subnet_v2" "local" {
  name            = "${var.prefix}_local_subnet"
  network_id      = openstack_networking_network_v2.local.id
  cidr            = var.local_cidr
  ip_version      = 4
  dns_nameservers = ["8.8.8.8", "1.1.1.1"]

  depends_on = [openstack_networking_network_v2.local]
}

# Network: net1, net2, net3
resource "openstack_networking_network_v2" "nets" {
  for_each       = var.subnets
  name           = "${var.prefix}_${each.key}"
  admin_state_up = true
}

resource "openstack_networking_subnet_v2" "subnets" {
  for_each        = var.subnets
  name            = "${var.prefix}_${each.key}_subnet"
  network_id      = openstack_networking_network_v2.nets[each.key].id
  cidr            = each.value
  ip_version      = 4
  dns_nameservers = ["8.8.8.8", "1.1.1.1"]

  depends_on = [openstack_networking_network_v2.nets]
}
