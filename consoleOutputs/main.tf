# Download the latest Ghost Image
resource "docker_image" "image_id" {
  name = "ghost:latest"
}

# Start the Container
resource "docker_container" "container_id" {
  name  = "blog"
  image = docker_image.image_id.latest
  ports {
    internal = "2368"
    external = "80"
  }
}

#Output the IP Address of the Container
output "IP_Address" {
  value = docker_container.container_id.ip_address
}

output "container_name" {
  value = docker_container.container_id.name
}

output "dockerimage_name" {
  value = docker_image.image_id.name
}
output "container_must_run" {
  value = docker_container.container_id.must_run
  sensitive = true
}
output "url" {
  description = "Browser URL for container site"
  value       = join(":", ["http://localhost", tostring(docker_container.container_id.ports[0].external)])
}

