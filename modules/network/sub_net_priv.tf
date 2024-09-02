resource "aws_subnet" "eks_subnet_priv_a" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.eks_vpc.cidr_block, 8, 3)
  availability_zone = "${data.aws_region.current.name}a"

  tags = {
    "Name"                            = "${var.project_name}-${data.aws_region.current.name}a-subnet-priv",
    "kubernetes.io/role/internal-elb" = 1
  }
}

resource "aws_subnet" "eks_subnet_priv_b" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.eks_vpc.cidr_block, 8, 4)
  availability_zone = "${data.aws_region.current.name}b"

  tags = {
    "Name"                            = "${var.project_name}-${data.aws_region.current.name}b-subnet-priv",
    "kubernetes.io/role/internal-elb" = 1
  }
}

resource "aws_route_table_association" "eks_rtb_assoc_priv_a" {
  subnet_id      = aws_subnet.eks_subnet_priv_a.id
  route_table_id = aws_route_table.eks_priv_route_table_a.id
}

resource "aws_route_table_association" "eks_rtb_assoc_priv_b" {
  subnet_id      = aws_subnet.eks_subnet_priv_b.id
  route_table_id = aws_route_table.eks_priv_route_table_b.id
}