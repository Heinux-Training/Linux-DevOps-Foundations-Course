data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd*/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "random_id" "key_suffix" {
  byte_length = 4
}

resource "tls_private_key" "ec2" {
  count = var.instance_count

  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ec2" {
  count = var.instance_count

  key_name   = "${var.project_name}-${random_id.key_suffix.hex}-i${count.index + 1}"
  public_key = tls_private_key.ec2[count.index].public_key_openssh

  tags = {
    Name = "${var.project_name}-key-i${count.index + 1}"
  }
}

resource "local_file" "ssh_private_key" {
  count = var.instance_count

  filename             = "${path.module}/generated/ssh-keys/instance-${count.index + 1}.pem"
  content              = tls_private_key.ec2[count.index].private_key_openssh
  file_permission      = "0600"
  directory_permission = "0700"
}

resource "aws_security_group" "ec2" {
  name        = "${var.project_name}-ec2-sg"
  description = "SSH + outbound internet for lab instances"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-ec2-sg"
  }
}

resource "aws_instance" "lab" {
  count = var.instance_count

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.small"
  subnet_id              = aws_subnet.public[count.index % 2].id
  vpc_security_group_ids = [aws_security_group.ec2.id]
  key_name               = aws_key_pair.ec2[count.index].key_name

  root_block_device {
    volume_size           = 20
    volume_type           = "gp3"
    delete_on_termination = true
    encrypted             = true
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  tags = {
    Name = "${var.project_name}-ec2-${count.index + 1}"
  }
}
