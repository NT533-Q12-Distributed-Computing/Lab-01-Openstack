output "router_id" {
  description = "ID của router đã tạo"
  value       = openstack_networking_router_v2.router.id
}
