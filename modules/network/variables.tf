# 中文：这个模块需要的输入变量
# English: Input variables required by this module.
# 日本語: このモジュールで使用する入力変数です。

variable "project_name" {
  description = "Project name used for tags"
  type        = string
}

variable "environment" {
  description = "Environment name such as dev or prod"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability zone for the public subnet"
  type        = string
  default     = "us-east-1a"
}
