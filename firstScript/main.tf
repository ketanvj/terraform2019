terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.16.0"
    }
  }
}

# Download the latest Ghost image
resource "docker_image" "image_id1" {
  name = "ghost:latest"
}

