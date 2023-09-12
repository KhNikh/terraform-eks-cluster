resource "aws_iam_role" "eks_nodes_role" {
  name = "eks-nodes-role"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "eks-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks_nodes_role.name
}

resource "aws_iam_role_policy_attachment" "eks-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam:aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks_nodes_role.name
}

resource "aws_iam_role_policy_attachment" "eks-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks_nodes_role.name
}

resource "aws_eks_node_group" "eks-nodegroup-1" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "ng-private"
  node_role_arn   = aws_iam_role.eks_cluster_role.arn
  subnet_ids      = [
        aws_subnet.eks-private-subnet-1.id,
        aws_subnet.eks-private-subnet-2.id
    ]
  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }
  capacity_type        = "ON_DEMAND"
  disk_size            = 15
  instance_types       = ["t2.medium"]
  force_update_version = false
  labels = {
    node = "private"
  }
  remote_access {
    ec2_ssh_key = "ec2-node-key"
  }
  update_config {
    max_unavailable_percentage = 75
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.eks-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks-AmazonEC2ContainerRegistryReadOnly,
  ]
}
