variable "prefix" {
  description = "Tiền tố dùng đặt tên cho các tài nguyên (VD: NT533_Q12_nhom01)"
  type        = string
}

variable "image_name" {
  description = "Tên image (VD: Ubuntu 22.04)"
  type        = string
}

variable "flavor_name" {
  description = "Tên flavor cho instance"
  type        = string
}

variable "keypair_name" {
  description = "Tên keypair để SSH vào máy"
  type        = string
}

variable "secgroup_id" {
  description = "ID của security group để gán cho instance"
  type        = string
}

variable "pcs" {
  description = <<EOT
Map cấu hình từng instance:
- network_ids: danh sách ID của các network mà máy sẽ nối vào
- user_data_path: đường dẫn file cloud-init tương ứng
EOT
  type = map(object({
    network_ids    = list(string)
    user_data_path = string
  }))
}

variable "local_network_id" {
  description = "ID của mạng local dùng để lấy port chính"
  type        = string
}

variable "secgroup_name" {
  description = "Tên của security group để gán cho instance"
  type        = string
}
