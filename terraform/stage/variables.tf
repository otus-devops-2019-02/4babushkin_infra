variable project {
  description = "Project ID"
}

variable region {
  description = "Region"

  # Значение по умолчанию
  default = "europe-west1"
}

variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}

variable private_key_path {
  # Описание переменной
  description = "Path to the private key used for ssh access"
}

variable disk_image {
  description = "Disk image"
}

variable zone {
  description = "Zone"
  default     = "europe-west1"
}

variable public_key_path_appuser1 {
  description = "Path to the public key used for ssh access for appuser1"
}

variable public_key_path_appuser2 {
  description = "Path to the public key used for ssh access for appuser1"
}

variable public_key_path_appuser3 {
  description = "Path to the public key used for ssh access for appuser1"
}

variable count {
  description = "Number of puma-servers"
  default     = 1
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}
variable db_machine_type {
  description = "Machine type"
  default     = "g1-small"
}
