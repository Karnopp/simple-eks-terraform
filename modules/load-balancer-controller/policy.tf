resource "aws_iam_policy" "eks_controller_policy" {
  name   = "${var.project_name}-${data.aws_region.current.name}-load-balancer-controller-policy"
  policy = file("${path.module}/iam_policy.json")
}