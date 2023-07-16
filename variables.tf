variable "location" {
  type    = string
  default = "\"uksouth\""
}

variable "db_username" {
  type = string
  sensitive = true
}

variable "db_password" {
  type = string
  sensitive = true
}

variable "home_ip" {
  type = string
  sensitive = true
}

variable "pgconnectionstring" {
  type      = string
  sensitive = false
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