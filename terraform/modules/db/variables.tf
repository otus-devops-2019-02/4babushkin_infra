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