# Download the latest Ghost Image
resource "docker_image" "image_id" {
  name = "nginx:alpine"
}

# Start the Container
resource "docker_container" "container_id" {
  name  = "webserver"
  image = docker_image.image_id.image_id
  ports {
    internal = "80"
    external = "80"
  }
}

#Output the IP Address of the Container
output "IP_Address" {
   value = docker_container.container_id.network_data[0].ip_address
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

