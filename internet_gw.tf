resource "aws_internet_gateway" "eks_internetgw" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = {
    Name = "eks_ig"
  }
}
