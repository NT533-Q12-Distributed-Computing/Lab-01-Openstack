output "network_names" {
  description = "Tên các network đã tạo"
  value = merge(
    {
      local = module.network.local_network_name
    },
    module.network.network_names
  )
}

output "subnet_cidrs" {
  description = "CIDR của các subnet"
  value = merge(
    {
      local = module.network.local_subnet_cidr
    },
    module.network.subnet_cidrs
  )
}

output "instance_fixed_ips" {
  description = "IP nội bộ (theo từng NIC) của từng máy"
  value       = module.instances.fixed_ips
}

output "floating_ips" {
  description = "Floating IP của từng máy"
  value       = module.floating_ip.floating_ips
}

output "debug_instance_ids" {
  value = module.instances.instance_ids
}

output "debug_port_ids" {
  value = module.instances.port_ids
}
