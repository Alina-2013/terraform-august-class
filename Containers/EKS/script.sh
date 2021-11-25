#!/bin/bash
curl -LO https://dl.k8s.io/release/v1.21.0/bin/linux/amd64/kubectl
chmod +x kubectl 
sudo mv kubectl /usr/local/bin/
kubectl version --client


#Install aws-iam-authenticator
curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator
chmod +x aws-iam-authenticator
sudo mv aws-iam-authenticator /usr/local/bin/
aws-iam-authenticator version

# Connect to EKS cluster called "my-cluster" in Virginia
aws eks --region us-east-1  update-kubeconfig --name my-cluster


# # Connect to EKS cluster called "dev" in Virginia
# aws eks --region us-east-1  update-kubeconfig --name dev


# # Connect to EKS cluster called "dev-eu" in eu-west-1
# aws eks --region eu-west-1  update-kubeconfig --name dev-eu