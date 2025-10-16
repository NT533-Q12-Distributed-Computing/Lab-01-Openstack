terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.54"
    }
  }
}

provider "openstack" {
  user_name   = var.username
  password    = var.password
  auth_url    = var.auth_url
  region      = var.region
  domain_name = var.domain_name
  tenant_name = var.project_name
  tenant_id   = var.project_id
}
