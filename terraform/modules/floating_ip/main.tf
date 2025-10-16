terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.54"
    }
  }
}

resource "openstack_networking_floatingip_v2" "fip" {
  for_each = var.port_ids
  pool     = var.external_network_name
}

resource "openstack_networking_floatingip_associate_v2" "assoc" {
  for_each    = var.port_ids
  floating_ip = openstack_networking_floatingip_v2.fip[each.key].address
  port_id     = each.value

  depends_on = [
    openstack_networking_floatingip_v2.fip
  ]
}
