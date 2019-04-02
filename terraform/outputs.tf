output "app_external_ip" {
  value = "${google_compute_instance.app.*.network_interface.0.access_config.0.nat_ip}"
}
output "bd_external_ip" {
  value = "${google_compute_instance.db.network_interface.0.access_config.0.nat_ip}"
}

# output "app_frontend_ip" {
#   value = "${google_compute_forwarding_rule.default.ip_address}"
# }

