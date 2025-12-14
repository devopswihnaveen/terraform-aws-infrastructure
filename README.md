
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
- SSH public key file (`personalkuy.pub`)

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

```hcl
# outputs.tf

output "instance_public_ip" {
    value       = aws_instance.my_instance.public_ip
    description = "The public IP address of the EC2 instance"
}

output "vpc_id" {
    value       = aws_vpc.main.id
    description = "The ID of the VPC"
}

output "subnet_id" {
    value       = aws_subnet.public.id
    description = "The ID of the public subnet"
}
```
