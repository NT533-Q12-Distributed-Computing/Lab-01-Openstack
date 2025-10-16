variable "prefix" {
  description = "Prefix nhóm (Ex: NT533_Q12_nhom01)"
  type        = string
}

variable "external_network_id" {
  description = "ID của external network (UUID lấy từ Horizon)"
  type        = string
}

variable "subnet_ids" {
  description = "Danh sách ID của các subnet nội bộ"
  type        = list(string)
}
