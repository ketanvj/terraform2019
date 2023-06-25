#Output the IP Address of the Container
output "shm" {
  value = docker_container.container_id.shm_size
}

output "container_name" {
  value = docker_container.container_id.name
}
