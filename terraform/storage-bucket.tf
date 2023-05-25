terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "bucnov"
    region     = "ru-central1"
    key        = "terraform.tfstate"
    access_key = "YCAFnG"
    secret_key = "YCMqLA"
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
