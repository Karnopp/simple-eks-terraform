resource "aws_eks_cluster" "eks_cluster" {
  name     = "${var.project_name}-${data.aws_region.current.name}"
  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = var.version_eks

  vpc_config {
    subnet_ids              = [var.pub_subnet_a, var.pub_subnet_b]
    endpoint_private_access = true
    endpoint_public_access  = true
  }

  upgrade_policy {
    support_type = "STANDARD"
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_role_attach
  ]
}