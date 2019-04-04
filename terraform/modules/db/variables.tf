variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}

variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}

variable zone {
  description = "Zone"
  default     = "europe-west1"
}

variable machine_type {
  description = "Machine type"
  default     = "f1-micro"
}

variable "network_name" {
  description = "Network name"
  default     = "default"
}

variable "firewall_db" {
  description = "Firewall db name"
  default     = "allow-mongo-default"
}

variable "db_allow_ports" {
  description = "Allow port"
  default     = ["27017"]
}

variable "allow_source_tags_instance" {
  description = "Tags on application"
  default     = ["reddit-app"]
}

variable "prefix_name_instance" {
  description = "Prefix to name of instanse"
  default     = ""
}
