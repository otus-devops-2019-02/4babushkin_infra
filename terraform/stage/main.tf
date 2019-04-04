terraform {
  # Версия terraform  # required_version = "0.11.11"
}

provider "google" {
  # Версия провайдера
  version = "2.0.0"

  # ID проекта
  project = "${var.project}"
  region  = "${var.region}"
}

module "db" {
  source                     = "../modules/db"
  public_key_path            = "${var.public_key_path}"
  zone                       = "${var.zone}"
  db_disk_image              = "${var.db_disk_image}"
  network_name               = "default"
  firewall_db                = "allow-mongo-default"
  db_allow_ports             = ["27017"]
  allow_source_tags_instance = ["reddit-app"]
  prefix_name_instance       = "stage"
}

module "app" {
  source                   = "../modules/app"
  public_key_path          = "${var.public_key_path}"
  zone                     = "${var.zone}"
  app_disk_image           = "${var.app_disk_image}"
  network_name             = "default"
  application_firewall     = "allow-puma-default"
  app_firewall_source_port = ["9292"]
  app_firewall_source_ip   = ["0.0.0.0/0"]
  prefix_name_instance     = "stage"
  private_key_path         = "~/.ssh/appuser"
  mongo_ip                 = "${module.db.db_local_ip}"
  count                    = 1
}

module "vpc" {
  source        = "../modules/vpc"
  source_ranges = ["0.0.0.0/0"]
}
