provider "aws" {
  region = var.region # replace with your preferred region

  # Uncomment and add your access and secret keys if not using a configured AWS CLI
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_security_group" "allow_proxy" {
  name        = "allow_proxy"
  description = "Allow incoming proxy connections"

  ingress {
    from_port   = 1080
    to_port     = 1080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allows connections from any IP
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allows SSH connections from any IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_proxy"
  }
}

resource "aws_instance" "proxy" {
  count = var.proxies_count

  ami           = var.ami_id # replace with the latest Amazon Linux 2 AMI ID
  instance_type = "t2.nano"

  vpc_security_group_ids = [aws_security_group.allow_proxy.id]
  depends_on             = [aws_security_group.allow_proxy]
  # key_name               = var.key_name # unccomment if you want to be able to ssh into the proxy

  ebs_block_device {
    device_name           = "/dev/xvda"
    volume_type           = "gp2"
    volume_size           = 8
    delete_on_termination = true
  }

  user_data = <<-FFF
#!/bin/bash
sudo amazon-linux-extras install epel -y
sudo yum install -y 3proxy

# Configure 3proxy
sudo tee /etc/3proxy.cfg <<EOF
daemon
maxconn 1024
nserver 8.8.8.8
nserver 8.8.4.4
nscache 65536

# Define the proxy ports and their settings
socks -p1080
auth strong
allow * 0.0.0.0/0
users ${var.proxy_login}:CL:${var.proxy_password}

# Define the access control rules
allow * * * 80-65535
deny * * *
EOF

# Start the 3proxy service
sudo systemctl enable 3proxy
sudo systemctl start 3proxy
FFF

  tags = {
    Name = "Proxy"
  }
}

output "proxy_ips" {
  value       = aws_instance.proxy[*].public_ip
  description = "The public IP addresses of the proxy instances"
}

output "proxies" {
  value       = join("\n", [for instance in aws_instance.proxy : "socks5://${var.proxy_login}:${var.proxy_password}@${instance.public_ip}:1080"])
  description = "Proxies"
}
