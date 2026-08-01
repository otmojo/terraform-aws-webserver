# 中文：EC2 模块的输入变量
# English: Input variables for the EC2 module.
# 日本語: EC2 モジュールの入力変数です。

variable "project_name" {
  description = "Project name used for naming"
  type        = string
}

variable "environment" {
  description = "Environment name such as dev or prod"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the instance"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance size"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID to use. If empty, the module will select Amazon Linux 2"
  type        = string
  default     = null
}
