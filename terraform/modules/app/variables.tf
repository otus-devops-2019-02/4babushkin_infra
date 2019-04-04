variable public_key_path {
  description = "Path to the public key used to connect to instance"
}

variable private_key_path {
  # Описание переменной
  description = "Path to the private key used for ssh access"
}

variable zone {
  description = "Zone"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}

variable machine_type {
  description = "Machine type"
  default     = "f1-micro"
}

variable "network_name" {
  description = "Name network application"
  default     = "default"
}

variable "application_firewall" {
  description = "Application allow firewall name"
  default     = "allow-puma-default"
}

variable "app_firewall_source_port" {
  description = "Firewall allow ports"
  default     = ["9292"]
}

variable "app_firewall_source_ip" {
  description = "Allow source ip address"
  default     = ["0.0.0.0/0"]
}

variable "count" {
  description = "Count of instans"
  default     = 1
}

variable "prefix_name_instance" {
  description = "Prefix to name of instanse"
  default     = ""
}

variable "mongo_ip" {
  description = "ip addres of DB"
  default     = "127.0.0.1"
}
