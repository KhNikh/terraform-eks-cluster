resource "aws_eip" "eks_natgw_eip" {
  depends_on = [aws_internet_gateway.eks_internetgw]
}
