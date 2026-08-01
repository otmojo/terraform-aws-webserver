# 中文：输出网络相关的 ID，方便给其他模块使用。
# English: Output network IDs so other modules can consume them.
# 日本語: 他のモジュールが利用できるように、ネットワーク関連の ID を出力します。

output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_id" {
  value = aws_subnet.public.id
}
