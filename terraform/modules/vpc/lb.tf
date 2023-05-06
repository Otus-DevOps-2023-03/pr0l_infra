resource "yandex_lb_network_load_balancer" "foo" {
  name = "loadbalancer"

  listener {
    name        = "my-listener"
    port        = 80
    target_port = 9292
    external_address_spec {
      ip_version = "ipv4"
    }
  }
  attached_target_group {
    target_group_id = yandex_lb_target_group.foo.id
    healthcheck {
      name = "http"
      http_options {
        port = 9292
        path = "/"
      }
    }
  }
}

resource "yandex_lb_target_group" "foo" {
  name      = "loadbalancer"
  folder_id = var.folder_id

  dynamic "target" {
    # for_each = [yandex_compute_instance.app[0].network_interface.0.ip_address,
    #             yandex_compute_instance.app[1].network_interface.0.ip_address]

    for_each = yandex_compute_instance.app.*.network_interface.0.ip_address
    content {
      subnet_id = var.subnet_id
      address   = target.value
    }
    # https://www.youtube.com/watch?v=UpgyPaX0rVA


    # target {
    #   subnet_id = var.subnet_id
    #   address = yandex_compute_instance.app[0].network_interface.0.ip_address
    # }
    # target {
    #   subnet_id = var.subnet_id
    #   address = yandex_compute_instance.app[1].network_interface.0.ip_address
    # }

  }
}
