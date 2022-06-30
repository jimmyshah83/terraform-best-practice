terraform {
  required_version = ">= 0.1.0.7"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.15.0"
    }
  }
}

resource "docker_container" "container" {
  image = var.image
  name  = var.name
  env = var.env
  networks_advanced {
    name = var.network_name
  }
  lifecycle {
    ignore_changes = all
  }
}
