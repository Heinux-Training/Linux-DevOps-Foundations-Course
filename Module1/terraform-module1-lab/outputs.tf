output "vpc_id" {
  description = "ID of the new VPC."
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "Two public subnet IDs."
  value       = aws_subnet.public[*].id
}

output "instance_ids" {
  description = "EC2 instance IDs."
  value       = aws_instance.lab[*].id
}

output "instance_public_ips" {
  description = "Public IPv4 addresses (after map_public_ip_on_launch + instance start)."
  value       = aws_instance.lab[*].public_ip
}

output "ssh_private_key_paths" {
  description = "Paths to PEM files on the machine where you ran terraform apply (relative to module root: generated/ssh-keys/)."
  value       = [for i in range(var.instance_count) : local_file.ssh_private_key[i].filename]
}

output "ssh_commands" {
  description = "Example SSH commands (Ubuntu user)."
  sensitive   = false
  value = [
    for i in range(var.instance_count) :
    "ssh -i ${local_file.ssh_private_key[i].filename} ubuntu@${aws_instance.lab[i].public_ip}"
  ]
}
