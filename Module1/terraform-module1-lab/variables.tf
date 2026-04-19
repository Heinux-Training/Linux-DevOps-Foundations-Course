variable "aws_region" {
  type        = string
  description = "AWS region for all resources."
  default     = "eu-central-1"
}

variable "aws_profile" {
  type        = string
  description = "Named profile from ~/.aws/config and ~/.aws/credentials (e.g. my-admin)."
  default     = "default"
}

variable "project_name" {
  type        = string
  description = "Prefix for resource names (VPC, keys, instances)."
  default     = "module1-lab"
}

variable "instance_count" {
  type        = number
  description = "How many EC2 instances to create (each gets its own SSH key file under generated/ssh-keys/)."
  default     = 1

  validation {
    condition     = var.instance_count >= 1 && var.instance_count <= 10
    error_message = "instance_count must be between 1 and 10."
  }
}

variable "allowed_ssh_cidr" {
  type        = string
  description = "IPv4 CIDR allowed to SSH (port 22). Narrow this in production (e.g. your public IP /32)."
  default     = "0.0.0.0/0"
}

variable "vpc_cidr" {
  type        = string
  description = "IPv4 CIDR for the new VPC."
  default     = "10.112.0.0/16"
}
