output "floating_ips" {
  value = { 
    for k, v in openstack_networking_floatingip_v2.fip : k => v.address 
    }
}