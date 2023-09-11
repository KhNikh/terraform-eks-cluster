resource "aws_vpc" "eks_vpc" {
  cidr_block       = "172.16.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "eks"
  }
  enable_dns_support               = true
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = false
}

output "vpc_id" {
  value       = aws_vpc.eks_vpc.id
  description = "VPC id"
  sensitive   = false
}
