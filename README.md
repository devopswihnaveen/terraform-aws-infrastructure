
# Terraform AWS Infrastructure

## Overview

This Terraform configuration deploys a basic AWS infrastructure with VPC, subnets, internet gateway, and EC2 instances.

## Resources

- **VPC**: Main virtual private cloud with DNS support
- **Subnet**: Public subnet in the first availability zone
- **Internet Gateway**: Enables internet connectivity for the VPC
- **EC2 Instance**: Ubuntu 20.04 instance (t2.micro)
- **Key Pair**: SSH key for EC2 access

## Prerequisites

- Terraform >= 1.0
- AWS CLI configured with credentials
- SSH public key file (`personalkey.ppk`)

## Usage

```bash
terraform init
terraform plan
terraform apply
```

## Variables

Define these in `terraform.tfvars`:

- `aws_region`: AWS region (e.g., `us-east-1`)
- `vpc_cidr`: VPC CIDR block (e.g., `10.0.0.0/16`)
- `subnet_cidr`: Subnet CIDR block (e.g., `10.0.1.0/24`)

## Outputs

Configure outputs in `outputs.tf` to display instance public IP and other relevant resources.

