variable "prefix" {
  description = "Prefix"
  type        = string
}

variable "local_cidr" {
  description = "CIDR local"
  type        = string
}

variable "subnets" {
  description = "Map subnet net1..net3"
  type        = map(string)
}
