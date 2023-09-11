resource "aws_nat_gateway" "eks_natgw" {
  allocation_id = aws_eip.eks_natgw_eip.id
  subnet_id     = aws_subnet.eks-public-subnet-1.id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.eks_internetgw]
}
