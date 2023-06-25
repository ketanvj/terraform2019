#Output the IP Address of the Container
output "shm" {
  value = module.container.shm
}

output "Container_Name" {
  value = module.container.container_name
}
