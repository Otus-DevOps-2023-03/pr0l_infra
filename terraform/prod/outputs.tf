# output "external_ip_address_app" {
#   value = yandex_compute_instance.app.network_interface.0.nat_ip_address
# }

# output "internal_ip_address_app" {
#   value = yandex_compute_instance.app[0].network_interface.0.ip_address
# }

# output "external_lb_address" {
#   value = yandex_lb_network_load_balancer.foo.listener.*.external_address_spec[0].*.address
# }

# output "lb_address_add" {
#   value = yandex_lb_network_load_balancer.foo.listener[*].external_address_spec[*].address
# }

# output "test_lb" {
#   value = [for s in yandex_lb_network_load_balancer.foo.listener: [for a in s.external_address_spec: a.address].0].0

# }
output "external_ip_address_app" {
  value = module.app.external_ip_address_app
}
output "external_ip_address_db" {
  value = module.db.external_ip_address_db
}
output "local_db_ip" {
  value = module.db.local_db_ip

}
