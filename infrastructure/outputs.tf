# Define outputs
output "ec2_instance_ips" {
  description = "Public IP addresses of the EC2 instances"
  value       = module.ec2.public_ips
}

output "rds_endpoint" {
  description = "Endpoint of the RDS database instance"
  value       = module.rds.endpoint
}
