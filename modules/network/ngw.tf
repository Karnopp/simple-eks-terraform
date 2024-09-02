resource "aws_eip" "eks_ngw_eip_a" {
  domain = "vpc"
  tags = {
    "Name" = "${var.project_name}-${data.aws_region.current.name}a-eip"
  }
}

resource "aws_eip" "eks_ngw_eip_b" {
  domain = "vpc"
  tags = {
    "Name" = "${var.project_name}-${data.aws_region.current.name}b-eip"
  }
}

resource "aws_nat_gateway" "eks_ngw_a" {
  allocation_id = aws_eip.eks_ngw_eip_a.id
  subnet_id     = aws_subnet.eks_subnet_pub_a.id

  tags = {
    Name = "${var.project_name}-${data.aws_region.current.name}a-ngw"
  }
}

resource "aws_nat_gateway" "eks_ngw_b" {
  allocation_id = aws_eip.eks_ngw_eip_b.id
  subnet_id     = aws_subnet.eks_subnet_pub_b.id

  tags = {
    Name = "${var.project_name}-${data.aws_region.current.name}b-ngw"
  }
}

resource "aws_route_table" "eks_priv_route_table_a" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_ngw_a.id
  }

  tags = {
    Name = "${var.project_name}-${data.aws_region.current.name}a-priv-rtb"
  }
}

resource "aws_route_table" "eks_priv_route_table_b" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_ngw_b.id
  }

  tags = {
    Name = "${var.project_name}-${data.aws_region.current.name}b-priv-rtb"
  }
}