# Download the latest Ghost Image
resource "docker_image" "image_id" {
  name = var.image
}
# Start the Container
resource "docker_container" "container_id" {
  name  = var.container_name
  image = docker_image.image_id.image_id
  ports {
    internal = var.int_port
    external = var.ext_port
  }
}

