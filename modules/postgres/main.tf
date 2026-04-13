terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

resource "docker_image" "postgres" {
  name         = "postgres:16"
  keep_locally = true
}

resource "docker_network" "idp_network" {
  name = "idp-network"
}

resource "docker_container" "postgres" {
  name  = "idp-postgres-tf"
  image = docker_image.postgres.image_id

  env = [
    "POSTGRES_USER=${var.postgres_user}",
    "POSTGRES_PASSWORD=${var.postgres_password}",
    "POSTGRES_DB=${var.postgres_db}"
  ]

  ports {
    internal = 5432
    external = var.postgres_port
  }

  networks_advanced {
    name = docker_network.idp_network.name
  }

  restart = "unless-stopped"
}

output "postgres_host" {
  value = "localhost"
}

output "container_id" {
  value = docker_container.postgres.id
}

output "network_name" {
  value = docker_network.idp_network.name
}
