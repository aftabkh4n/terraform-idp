variable "app_name" {
  type = string
}

variable "postgres_host" {
  type = string
}

variable "postgres_port" {
  type = number
}

variable "postgres_user" {
  type = string
}

variable "postgres_db" {
  type = string
}

variable "postgres_password" {
  type      = string
  sensitive = true
  default   = ""
}