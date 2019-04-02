terraform {
  # Версия terraform
  required_version = "0.11.11"
}

provider "google" {
  # Версия провайдера
  version = "2.0.0"

  # ID проекта
  project = "${var.project}"
  region  = "${var.region}"
}

#provisioner "file" {
#  source      = "files/puma.service"
#  destination = "/tmp/puma.service"
#}


#provisioner "remote-exec" {
#  script = "files/deploy.sh"
#}

