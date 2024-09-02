output "subnet_pub_a" {
  value = aws_subnet.eks_subnet_pub_a.id
}

output "subnet_pub_b" {
  value = aws_subnet.eks_subnet_pub_b.id
}

output "subnet_priv_a" {
  value = aws_subnet.eks_subnet_priv_a.id
}

output "subnet_priv_b" {
  value = aws_subnet.eks_subnet_priv_b.id
}