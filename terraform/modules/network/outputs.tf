output "local_network_id" {
  value = openstack_networking_network_v2.local.id
}

output "local_subnet_id" {
  value = openstack_networking_subnet_v2.local.id
}

output "network_ids" {
  value = { for k, v in openstack_networking_network_v2.nets : k => v.id }
}

output "subnet_ids" {
  value = { for k, v in openstack_networking_subnet_v2.subnets : k => v.id }
}

output "local_network_name" {
  value = openstack_networking_network_v2.local.name
}

output "network_names" {
  value = { for k, v in openstack_networking_network_v2.nets : k => v.name }
}

output "local_subnet_cidr" {
  value = var.local_cidr
}

output "subnet_cidrs" {
  value = var.subnets
}
