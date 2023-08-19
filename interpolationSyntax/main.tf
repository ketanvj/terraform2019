terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.21.0"
    }
  }
}

# Download the latest Ghost image
resource "docker_image" "nginx" {
  name = "nginx:alpine"
}

# Start the Container
resource "docker_container" "container_id" {
  name  = "webserver"
  image = docker_image.nginx.image_id
  ports {
    internal = "80"
    external = "80"
  }
}

