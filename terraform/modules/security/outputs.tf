output "secgroup_id" {
  description = "ID của security group"
  value       = openstack_networking_secgroup_v2.sec.id
}

output "secgroup_name" {
  description = "Security group name"
  value       = openstack_networking_secgroup_v2.sec.name
}

