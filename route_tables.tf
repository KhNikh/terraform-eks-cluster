resource "aws_route_table" "eks-public-rt" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_internetgw.id
  }

  tags = {
    Name = "eks_pubrt"
  }
}
resource "aws_route_table" "eks-private-rt-1" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.eks_natgw.id
  }

  tags = {
    Name = "eks_privrt1"
  }
}
resource "aws_route_table" "eks-private-rt-2" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.eks_natgw.id
  }

  tags = {
    Name = "eks_privrt2"
  }
}
