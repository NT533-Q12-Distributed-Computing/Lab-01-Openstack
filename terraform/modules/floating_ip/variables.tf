variable "instances" {
  description = "Map of instance names (key = pc0, pc1...)"
  type        = map(string)
}

variable "port_ids" {
  description = "Map of instance ports (key = pc0, pc1...)"
  type        = map(string)
}

variable "external_network_name" {
  description = "Tên external network (VD: Public_Net)"
  type        = string
}
