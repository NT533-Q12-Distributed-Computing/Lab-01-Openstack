terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.54"
    }
  }
}

# Router chính
resource "openstack_networking_router_v2" "router" {
  name                = "${var.prefix}_R"
  admin_state_up      = true
  external_network_id = var.external_network_id
}

# Thêm các subnet vào router (kết nối các network)
# Sử dụng count để tránh lỗi for_each với giá trị unknown
resource "openstack_networking_router_interface_v2" "ifaces" {
  count     = length(var.subnet_ids)
  router_id = openstack_networking_router_v2.router.id
  subnet_id = var.subnet_ids[count.index]
}
