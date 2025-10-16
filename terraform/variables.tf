# ========== Basic Info ==========
variable "prefix" {
  description = "Prefix nhóm, ví dụ NT533_Q12_nhom01"
  type        = string
}

# ========== Network ==========
variable "local_cidr" {
  description = "CIDR cho mạng local"
  type        = string
}

variable "subnets" {
  description = "Danh sách subnet cho net1, net2, net3"
  type        = map(string)
}

# ========== External Network ==========
variable "external_network_name" {
  description = "Tên của External Network (Public_Net)"
  type        = string
}

variable "external_network_id" {
  description = "ID của External Network (Public_Net)"
  type        = string
}

# ========== SSH & Key ==========
variable "ssh_cidrs" {
  description = "Danh sách CIDR được phép SSH"
  type        = list(string)
}

variable "public_key_path" {
  description = "Đường dẫn đến file public key"
  type        = string
}

# ========== Image & Flavor ==========
variable "image_name" {
  description = "Tên image trên Horizon"
  type        = string
}

variable "flavor_name" {
  description = "Tên flavor của instance"
  type        = string
}

# ========== OpenStack Auth ==========
variable "auth_url" {
  description = "OpenStack Keystone URL"
  type        = string
  default     = "https://cloud.uitiot.vn:5000/v3"
}

variable "region" {
  description = "Tên vùng (RegionOne)"
  type        = string
  default     = "RegionOne"
}

variable "username" {
  description = "Tên đăng nhập OpenStack"
  type        = string
}

variable "password" {
  description = "Mật khẩu OpenStack"
  type        = string
  sensitive   = true
}

variable "domain_name" {
  description = "Domain (thường là Default)"
  type        = string
  default     = "Default"
}

variable "project_name" {
  description = "Tên Project (ví dụ: NT533.P21)"
  type        = string
}

variable "project_id" {
  description = "ID của Project (trong Identity → Projects)"
  type        = string
}
