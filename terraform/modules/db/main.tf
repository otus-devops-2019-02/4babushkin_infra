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
#  provisioner "remote-exec" {
#    inline = [
#      "sudo sed -i 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/g' /etc/mongod.conf",
#      "sudo systemctl restart mongod",
#    ]
#
#    connection {
#      type        = "ssh"
#      user        = "appuser"
#      agent       = "false"
#      private_key = "${file(var.private_key_path)}"
#    }
#  }
}

# Правило firewall
resource "google_compute_firewall" "firewall_mongo" {
  name    = "${var.firewall_db}"
  network = "${var.network_name}" #доступ только в локальной сети
  #network = "default" # если надо доcтуп отовсюду

  allow {
    protocol = "tcp"
    ports    = "${var.db_allow_ports}"
  }

  target_tags = ["reddit-db"]
  source_tags = "${var.allow_source_tags_instance}"
}
