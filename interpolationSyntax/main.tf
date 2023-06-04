terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.21.0"
    }
  }
}

# Download the latest Ghost image
resource "docker_image" "ghost" {
  name = "ghost:latest"
}

# Start the Container
resource "docker_container" "container_id" {
  name  = "blog"
  image = docker_image.ghost.image_id
  ports {
    internal = "2368"
    external = "80"
  }
}

