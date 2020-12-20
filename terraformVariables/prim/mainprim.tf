variable "image" {
  description = "container image name"
#  default = "ghost:latest"
}

# Download the latest Ghost image
resource "docker_image" "image_id" {
  name = var.image
}

