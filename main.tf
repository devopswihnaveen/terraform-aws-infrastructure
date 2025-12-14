# main.tf
terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

provider "aws" {
    region = var.aws_region
}

# VPC
resource "aws_vpc" "main" {
    cidr_block           = var.vpc_cidr
    enable_dns_hostnames = true
    enable_dns_support   = true

    tags = {
        Name = "main-vpc"
    }
}

# Subnet
resource "aws_subnet" "main" {
    vpc_id            = aws_vpc.main.id
    cidr_block        = var.subnet_cidr
    availability_zone = data.aws_availability_zones.available.names[0]

    tags = {
        Name = "main-subnet"
    }
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "main-igw"
    }
}

# Data source for availability zones
data "aws_availability_zones" "available" {
    state = "available"
}

# EC2 Instance
resource "aws_instance" "ubuntu" {
    ami                    = data.aws_ami.ubuntu.id
    instance_type          = "t2.micro"
    subnet_id              = aws_subnet.main.id
    key_name               = aws_key_pair.personal.key_name
    associate_public_ip_address = true

    tags = {
        Name = "ubuntu-instance"
    }
}

# Data source for Ubuntu 20.04 AMI
data "aws_ami" "ubuntu" {
    most_recent = true
    owners      = ["099720109477"] # Canonical

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}

# Import existing key pair
resource "aws_key_pair" "personal" {
    key_name   = "personalkuy"
    public_key = file("${path.module}/personalkuy.pub")
}