# Terraform EKS Project

## Overview
This project provisions an AWS Elastic Kubernetes Service (EKS) cluster and its supporting infrastructure using Terraform. It leverages community modules for both EKS and VPC, and automates the deployment process with a Jenkins CI/CD pipeline.

## Architecture
- **EKS Cluster:** Managed Kubernetes cluster on AWS.
- **VPC:** Custom Virtual Private Cloud with public, private, and intra subnets.
- **Node Groups:** Managed node groups using spot instances for cost efficiency.
- **Networking:** NAT and VPN gateways enabled for secure and scalable networking.

## Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) >= 1.3.2
- [AWS CLI](https://aws.amazon.com/cli/)
- AWS account with permissions to create EKS, VPC, and related resources
- Jenkins server (for CI/CD)

## Setup Instructions
1. **Clone the repository:**
   ```sh
   git clone https://github.com/Kosalendra-Kalluri/Eks-cluster.git
   cd Eks-cluster
   ```
2. **Configure AWS credentials:**
   Ensure your AWS credentials are set up locally or via Jenkins credentials.

3. **Initialize Terraform:**
   ```sh
   terraform init
   ```

4. **Validate the configuration:**
   ```sh
   terraform validate
   ```

5. **Plan the deployment:**
   ```sh
   terraform plan -out=tfplan
   ```

6. **Apply the changes:**
   ```sh
   terraform apply tfplan
   ```

## Jenkins CI/CD Pipeline
The included `Jenkinsfile` automates the following steps:
- Checkout code from the repository
- Set AWS credentials using Jenkins credentials binding
- Run `terraform init`, `validate`, `plan`, and `apply` (with manual approval)

## File Structure
- `main.tf` - Terraform backend and provider requirements
- `provider.tf` - AWS provider configuration
- `locals.tf` - Local variables for region, naming, and networking
- `vpc.tf` - VPC and networking resources
- `eks.tf` - EKS cluster and node group resources
- `Jenkinsfile` - Jenkins pipeline for CI/CD
- `README.MD` - Project documentation

## Customization
- Update values in `locals.tf` to match your desired region, naming, and subnet CIDRs.
- Adjust EKS node group settings in `eks.tf` as needed.
