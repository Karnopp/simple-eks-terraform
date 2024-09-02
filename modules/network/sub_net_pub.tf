resource "aws_subnet" "eks_subnet_pub_a" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = cidrsubnet(aws_vpc.eks_vpc.cidr_block, 8, 1)
  availability_zone       = "${data.aws_region.current.name}a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                   = "${var.project_name}-${data.aws_region.current.name}a-subnet-pub",
    "kubernetes.io/role/elb" = 1
  }
}

resource "aws_subnet" "eks_subnet_pub_b" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = cidrsubnet(aws_vpc.eks_vpc.cidr_block, 8, 2)
  availability_zone       = "${data.aws_region.current.name}b"
  map_public_ip_on_launch = true

  tags = {
    "Name"                   = "${var.project_name}-${data.aws_region.current.name}b-subnet-pub",
    "kubernetes.io/role/elb" = 1
  }
}

resource "aws_route_table_association" "eks_rtb_assoc_pub_a" {
  subnet_id      = aws_subnet.eks_subnet_pub_a.id
  route_table_id = aws_route_table.eks_pub_route_table.id
}

resource "aws_route_table_association" "eks_rtb_assoc_pub_b" {
  subnet_id      = aws_subnet.eks_subnet_pub_b.id
  route_table_id = aws_route_table.eks_pub_route_table.id
}