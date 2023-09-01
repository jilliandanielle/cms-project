# Declare variables
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {
  default = "us-east-1" # Change to your desired AWS region
}

# Variables for EC2
variable "instance_count" {
  description = "Number of EC2 instances"
  type        = number
  default     = 1
}
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

# Variables for RDS
variable "db_instance_type" {
  description = "RDS instance type"
  type        = string
  default     = "db.t2.micro"
}

# Variables for Load Balancer
variable "lb_name" {
  description = "Name for the Application Load Balancer"
  type        = string
  default     = "my-cms-lb"
}
