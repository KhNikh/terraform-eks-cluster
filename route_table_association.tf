resource "aws_route_table_association" "private-1" {
  subnet_id      = aws_subnet.eks-private-subnet-1.id
  route_table_id = aws_route_table.eks-private-rt-1.id
}

resource "aws_route_table_association" "public-1" {
  subnet_id      = aws_subnet.eks-public-subnet-1.id
  route_table_id = aws_route_table.eks-public-rt.id
}

resource "aws_route_table_association" "private-2" {
  subnet_id      = aws_subnet.eks-private-subnet-2.id
  route_table_id = aws_route_table.eks-private-rt-2.id
}

resource "aws_route_table_association" "public-2" {
  subnet_id      = aws_subnet.eks-public-subnet-2.id
  route_table_id = aws_route_table.eks-public-rt.id
}
