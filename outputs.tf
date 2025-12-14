output "instance_id" {
    description = "The ID of the EC2 instance"
    value       = aws_instance.my_instance.id
}

output "instance_public_ip" {
    description = "The public IP of the EC2 instance"
    value       = aws_instance.my_instance.public_ip
}

output "vpc_id" {
    description = "The ID of the VPC"
    value       = aws_vpc.my_vpc.id
}

output "subnet_id" {
    description = "The ID of the subnet"
    value       = aws_subnet.my_subnet.id
}