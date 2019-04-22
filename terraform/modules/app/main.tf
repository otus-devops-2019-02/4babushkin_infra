resource "google_compute_instance" "app" {
  name         = "reddit-app-${var.prefix_name_instance}-${count.index+1}"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"
  tags         = ["reddit-app"]
  count        = "${var.count}"

  boot_disk {
    initialize_params {
      image = "${var.app_disk_image}"
    }
  }

  network_interface {
    network = "${var.network_name}"

    access_config = {}
  }

  metadata {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }

  connection {
    type        = "ssh"
    user        = "appuser"
    agent       = false
    private_key = "${file(var.private_key_path)}"
  }

  # provisioner "file" {
  #   content     = "${data.template_file.puma_service.rendered}"
  #   destination = "/tmp/puma.service"
  # }

  # provisioner "remote-exec" {
  #   script = "${path.module}/deploy.sh"
  # }
}

resource "google_compute_address" "app_ip" {
  name = "reddit-app-ip"
}

resource "google_compute_firewall" "firewall_puma" {
  name    = "allow-puma-default"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["${var.app_firewall_source_port}", "80"]
  }

  source_ranges = "${var.app_firewall_source_ip}"
  target_tags   = ["reddit-app"]
}


data "template_file" "puma_service" {
  template = "${file("${path.module}/puma.service")}"

  vars {
    mongo_ip = "${var.mongo_ip}"
  }
}
