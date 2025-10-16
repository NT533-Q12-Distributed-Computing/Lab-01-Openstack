# Output instance IDs
output "instance_ids" {
  description = "Map instance name -> instance ID"
  value = { for k, v in openstack_compute_instance_v2.pc : k => v.id }
}

# Output fixed IPs
output "fixed_ips" {
  description = "Map instance name -> list of fixed IPs"
  value = {
    for k, v in openstack_compute_instance_v2.pc :
    k => [for n in v.network : n.fixed_ip_v4]
  }
}

# Lấy port ID chính xác bằng cách chỉ lọc theo local network
data "openstack_networking_port_v2" "ports" {
  for_each = openstack_compute_instance_v2.pc

  device_id  = each.value.id
  network_id = var.local_network_id
}

output "port_ids" {
  description = "Map instance name -> primary port ID"
  value = { for k, v in data.openstack_networking_port_v2.ports : k => v.id }
}

# Debug tiện theo dõi
output "debug_instance_ids" {
  value = { for k, v in openstack_compute_instance_v2.pc : k => v.id }
}

output "debug_port_ids" {
  value = { for k, v in data.openstack_networking_port_v2.ports : k => v.id }
}
