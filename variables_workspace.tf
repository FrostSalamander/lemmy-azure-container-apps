## Values for these are set in the Terraform workspace UI

variable "db_username" {
  type      = string
  sensitive = true
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "home_ip" {
  type      = string
  sensitive = true
}

variable "pgconnectionstring" {
  type      = string
  sensitive = false
}

variable "container_env_cert" {
  type      = string
  sensitive = true
}