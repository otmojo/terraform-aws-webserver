# 中文：开发环境入口文件，调用各个模块来搭建最小 Web 服务。
# English: The development environment entry point calls the modules to build a minimal web service.
# 日本語: 開発環境のエントリーファイルで、各モジュールを呼び出して最小構成の Web サービスを構築します。

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "network" {
  source = "../../modules/network"

  project_name      = "terraform-webserver"
  environment       = "dev"
  vpc_cidr          = "10.0.0.0/16"
  subnet_cidr       = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

module "security_group" {
  source = "../../modules/security-group"

  name    = "terraform-webserver-dev-sg"
  vpc_id  = module.network.vpc_id
}

module "ec2" {
  source = "../../modules/ec2"

  project_name      = "terraform-webserver"
  environment       = "dev"
  subnet_id         = module.network.subnet_id
  security_group_id = module.security_group.security_group_id
}

output "instance_public_ip" {
  value = module.ec2.public_ip
}
