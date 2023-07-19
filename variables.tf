variable "location" {
  type    = string
  default = "\"uksouth\""
}

variable "db_server_name" {
  type = string
}

variable "lemmy_external_fqdn" {
  type = string
}

variable "helloworld_nginx_image" {
  type = string
}

variable "nginx_image" {
  type = string
}

variable "caddy_image" {
  type = string
}

variable "lemmy_ui_image" {
  type = string
}

variable "lemmy_image" {
  type = string
}