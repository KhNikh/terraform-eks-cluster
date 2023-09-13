# terraform-eks-cluster

This repository contains Terraform configurations to deploy an Amazon Elastic Kubernetes Service (EKS) cluster on AWS along with its associated node groups.

## Prerequisites
Before you begin, make sure you have the following prerequisites:

AWS Account: You'll need an AWS account with appropriate permissions to create the required resources.

Terraform: Make sure you have Terraform installed on your local machine.

AWS CLI: Install and configure the AWS CLI.

Kubectl: Install kubectl to interact with your Kubernetes cluster. 

## Getting Started

Follow these steps to deploy your EKS cluster:

Clone the Repository:
<pre>
```
git clone https://github.com/your-username/your-eks-cluster.git
cd your-eks-cluster
```
</pre>

Initialize Terraform:

Run the following commands to initialize Terraform:
<pre>
```
terraform init
```
</pre>

Create the EKS Cluster:

Apply the Terraform configuration to create your EKS cluster and node groups.

<pre>
```
terraform apply
```
</pre>

Configure kubectl:

After the EKS cluster is created, you need to configure kubectl to interact with it. Run the following command:
<pre>
```
aws eks --region <region> update-kubeconfig --name your-eks-cluster-name
```
</pre>

Replace <region> with your AWS region and your-eks-cluster-name with your cluster name.

Verify the Cluster:

Check if your cluster is ready by running:

<pre>
```
kubectl get nodes
```
</pre>

## Cleanup

When you're finished with your EKS cluster and want to clean up the resources, run:

<pre>
```
terraform destroy
```
</pre>

