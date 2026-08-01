# 中文：输出安全组 ID，方便 EC2 模块使用。
# English: Output the security group ID so the EC2 module can use it.
# 日本語: EC2 モジュールが利用できるように、セキュリティグループ ID を出力します。

output "security_group_id" {
  value = aws_security_group.webserver.id
}
