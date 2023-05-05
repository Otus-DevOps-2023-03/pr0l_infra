terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "bucket-otus-asmirnov"
    region     = "ru-central1"
    key        = "terraform.tfstate"
    access_key = "YCAu7W"
    secret_key = "YCM8Rv"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
