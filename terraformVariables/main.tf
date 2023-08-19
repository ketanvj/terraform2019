variable "container_name" {
  description = "Name of container"
  default = "blog"
}
variable "image" {
  description = "image for container"
  default = "ghost:latest"
}
variable "int_port" {
  description = "internal port for container"
  #default = "2368"

  validation {
    condition = length(var.int_port) <= 4
    error_message = "Port values can only be maximum 4 digits."

  }
}
variable "ext_port" {
  description = "external port for container"
  default = "80"
}

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

#Output the IP Address of the Container
output "IP_Address" {
  value = docker_container.container_id.network_data[0].ip_address
}

output "container_name" {
  value = docker_container.container_id.name
}

