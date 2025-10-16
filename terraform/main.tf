# Network
module "network" {
  source     = "./modules/network"
  prefix     = local.prefix
  local_cidr = var.local_cidr
  subnets    = var.subnets
}

# Router
module "router" {
  source              = "./modules/router"
  prefix              = local.prefix
  external_network_id = var.external_network_id

  subnet_ids = [
    module.network.local_subnet_id,
    module.network.subnet_ids["net1"],
    module.network.subnet_ids["net2"],
    module.network.subnet_ids["net3"]
  ]

  depends_on = [module.network]
}

# Security Group
module "security" {
  source    = "./modules/security"
  prefix    = local.prefix
  ssh_cidrs = var.ssh_cidrs
}

# Keypair
module "keypair" {
  source          = "./modules/keypair"
  keypair_name    = replace(local.prefix, ".", "_")
  public_key_path = var.public_key_path
}

# Instances
module "instances" {
  source        = "./modules/instances"
  prefix        = local.prefix
  image_name    = var.image_name
  flavor_name   = var.flavor_name
  secgroup_id   = module.security.secgroup_id
  secgroup_name = module.security.secgroup_name

  keypair_name  = module.keypair.keypair_name
  local_network_id = module.network.local_network_id

  pcs = {
    pc0 = {
      network_ids = [
        module.network.local_network_id,
        module.network.network_ids["net1"],
        module.network.network_ids["net2"],
        module.network.network_ids["net3"],
      ]
      user_data_path = "${path.module}/cloud-init/pc0-init.yaml"
    }
    pc1 = {
      network_ids = [
        module.network.local_network_id,
        module.network.network_ids["net1"],
      ]
      user_data_path = "${path.module}/cloud-init/pc1-init.yaml"
    }
    pc2 = {
      network_ids = [
        module.network.local_network_id,
        module.network.network_ids["net2"],
      ]
      user_data_path = "${path.module}/cloud-init/pc2-init.yaml"
    }
    pc3 = {
      network_ids = [
        module.network.local_network_id,
        module.network.network_ids["net3"],
      ]
      user_data_path = "${path.module}/cloud-init/pc3-init.yaml"
    }
  }

  depends_on = [module.network]
}

# Floating IP
module "floating_ip" {
  source                = "./modules/floating_ip"

  # Truyền map các instance IDs và port IDs từ module instances
  instances             = module.instances.instance_ids
  port_ids              = module.instances.port_ids

  # Truyền external network name (Public_Net)
  external_network_name = var.external_network_name

  depends_on = [module.instances] # đảm bảo instance được tạo xong trước
}
