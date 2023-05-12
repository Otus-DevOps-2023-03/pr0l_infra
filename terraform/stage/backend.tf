terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "bucket-otus-asmirnov"
    region     = "ru-central1"
    key        = "terraform.tfstate"
    access_key = "YCAJEe7onsPoI2qTUuPpjALVz"
    secret_key = "YCMBY9Nl4JkwkjeATarraD7lC9EFDN0-eKd7IuV0"
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
