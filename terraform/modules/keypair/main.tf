terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.54"
    }
  }
}

resource "openstack_compute_keypair_v2" "kp" {
  name       = var.keypair_name
  public_key = file(var.public_key_path)
}
