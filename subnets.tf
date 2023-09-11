resource "aws_subnet" "eks-private-subnet-1" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "172.16.0.0/18"
  availability_zone = "ap-south-1a"
  tags = {
    Name                              = "priv-subnet-1"
    "kubernetes.io/cluster/eks"       = "owned"
    "kubernetes.io/role/internal-elb" = 1
  }
}
resource "aws_subnet" "eks-public-subnet-1" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "172.16.64.0/18"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true
  tags = {
    Name                        = "pub-subnet-1"
    "kubernetes.io/cluster/eks" = "owned"
    "kubernetes.io/role/elb"    = 1
  }
}
resource "aws_subnet" "eks-private-subnet-2" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "172.16.128.0/18"
  availability_zone = "ap-south-1b"
  tags = {
    Name                              = "priv-subnet-2"
    "kubernetes.io/cluster/eks"       = "owned"
    "kubernetes.io/role/internal-elb" = 1
  }
}
resource "aws_subnet" "eks-public-subnet-2" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "172.16.192.0/18"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true
  tags = {
    Name                        = "pub-subnet-2"
    "kubernetes.io/cluster/eks" = "owned"
    "kubernetes.io/role/elb"    = 1
  }
}
