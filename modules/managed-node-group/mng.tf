resource "aws_eks_node_group" "eks_managed_node_group" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.project_name}-${data.aws_region.current.name}-nodegroup"
  node_role_arn   = aws_iam_role.eks_mng_cluster_role.arn
  subnet_ids      = [var.priv_subnet_a, var.priv_subnet_b]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_mng_cluster_role_attach_cni,
    aws_iam_role_policy_attachment.eks_mng_cluster_role_attach_ecr,
    aws_iam_role_policy_attachment.eks_mng_cluster_role_attach_worker,
  ]
}