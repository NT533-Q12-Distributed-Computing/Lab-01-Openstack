variable "prefix" {
  description = "Prefix đặt tên"
  type        = string
}

variable "ssh_cidrs" {
  description = "CIDR được phép SSH"
  type        = list(string)
}
