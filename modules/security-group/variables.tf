# 中文：安全组模块的输入变量
# English: Input variables for the security group module.
# 日本語: セキュリティグループモジュールの入力変数です。

variable "name" {
  description = "Security group name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}
