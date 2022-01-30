#Output the IP Address of the Container
output "IP_Address" {
  value = docker_container.container_id.ip_address
}
output "container_name" {
  value = docker_container.container_id.name
}
