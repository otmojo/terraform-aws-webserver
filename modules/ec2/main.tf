# 中文：EC2 模块负责创建一台可访问的 Web 服务器实例。
# English: The EC2 module creates a publicly reachable web server instance.
# 日本語: EC2 モジュールは公開可能な Web サーバーインスタンスを作成します。

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "webserver" {
  ami                         = var.ami_id != null ? var.ami_id : data.aws_ami.amazon_linux_2.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true

  user_data = <<-EOF
#!/bin/bash
yum update -y
amazon-linux-extras enable nginx1
yum install -y nginx
systemctl start nginx
systemctl enable nginx
printf '<h1>Hello from Terraform</h1>' > /usr/share/nginx/html/index.html
EOF

  tags = {
    Name        = "${var.project_name}-${var.environment}-webserver"
    Environment = var.environment
  }
}
