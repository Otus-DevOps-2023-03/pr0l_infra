# terraform {
#   required_providers {
#     yandex = {
#       source  = "yandex-cloud/yandex"
#       version = "0.90.0"
#     }
#   }
# }
resource "yandex_compute_instance" "app" {
  name = "reddit-app"
  labels = {
    tags = "reddit-app"
  }
  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
  boot_disk {
    initialize_params {
      # Указать id образа созданного в предыдущем домашем задании
      image_id = var.app_disk_image
    }
  }
  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }
  connection {
    type  = "ssh"
    host  = self.network_interface.0.nat_ip_address
    user  = "ubuntu"
    agent = false
    # путь до приватного ключа
    private_key = file(var.private_key_path)
  }

  # provisioner "remote-exec" {
  #   inline = [
  #     "echo \"DATABASE_URL=${var.address_db}\" >> /tmp/puma.env"
  #   ]
  # # }
#   provisioner "file" {
#     source      = "${path.module}/files/puma.service"
#     destination = "/tmp/puma.service"
#   }
#   provisioner "remote-exec" {
#     script = "${path.module}/files/deploy.sh"
#   }
}
