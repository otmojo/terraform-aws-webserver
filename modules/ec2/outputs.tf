# 中文：输出实例 ID 和公有 IP，方便后续查看和访问。
# English: Output the instance ID and public IP for later inspection and access.
# 日本語: 後で確認・アクセスできるように、インスタンス ID とパブリック IP を出力します。

output "instance_id" {
  value = aws_instance.webserver.id
}

output "public_ip" {
  value = aws_instance.webserver.public_ip
}
