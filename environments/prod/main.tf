# 中文：生产环境入口文件，采用与开发环境相似的最小结构。
# English: The production environment entry point uses a similar minimal structure to dev.
# 日本語: 本番環境のエントリーファイルは、開発環境と同様の最小構成で定義します。

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
  environment       = "prod"
  vpc_cidr          = "10.1.0.0/16"
  subnet_cidr       = "10.1.1.0/24"
  availability_zone = "us-east-1b"
}

module "security_group" {
  source = "../../modules/security-group"

  name    = "terraform-webserver-prod-sg"
  vpc_id  = module.network.vpc_id
}

module "ec2" {
  source = "../../modules/ec2"

  project_name      = "terraform-webserver"
  environment       = "prod"
  subnet_id         = module.network.subnet_id
  security_group_id = module.security_group.security_group_id
  instance_type     = "t3.small"
}

output "instance_public_ip" {
  value = module.ec2.public_ip
}
