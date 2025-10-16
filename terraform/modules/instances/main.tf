terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.54"
    }
  }
}

resource "openstack_compute_instance_v2" "pc" {
  for_each = var.pcs

  name        = "${var.prefix}_${each.key}"
  image_name  = var.image_name
  flavor_name = var.flavor_name
  key_pair    = var.keypair_name

  # Gán security group (bằng tên, không phải ID)
  security_groups = [var.secgroup_name]

  # Gán network cho từng máy
  dynamic "network" {
    for_each = each.value.network_ids
    content {
      uuid = network.value
    }
  }

  # Cloud-init script
  user_data = file(each.value.user_data_path)
}
