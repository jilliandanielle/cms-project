output "lb_arn" {
  description = "The Amazon Resource Name (ARN) of the Application Load Balancer"
  value       = aws_lb.load_balancer.arn
}

output "lb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = aws_lb.load_balancer.dns_name
}

output "lb_security_group_id" {
  description = "The security group ID associated with the Application Load Balancer"
  value       = aws_security_group.load_balancer_sg.id
}
