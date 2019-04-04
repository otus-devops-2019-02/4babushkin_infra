resource "google_compute_instance" "db" {
  name         = "reddit-db-${var.prefix_name_instance}-${count.index+1}"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"
  tags         = ["reddit-db"]

  boot_disk {
    initialize_params {
      image = "${var.db_disk_image}"
    }
  }

  network_interface {
    network       = "${var.network_name}"
    access_config = {}
  }

  metadata {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }
}

# Правило firewall
resource "google_compute_firewall" "firewall_mongo" {
  name    = "${var.firewall_db}"
  network = "${var.network_name}"

  allow {
    protocol = "tcp"
    ports    = "${var.db_allow_ports}"
  }

  target_tags = ["reddit-db"]
  source_tags = "${var.allow_source_tags_instance}"
}
