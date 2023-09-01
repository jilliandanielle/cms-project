
provider "aws" {
  region = "us-east-1" # Replace with your desired AWS region
}

# Create a Virtual Private Cloud (VPC)
module "vpc" {
  source = "./modules/vpc" # Path to your VPC module

  # You can customize VPC settings here
}

# Create EC2 instances for the CMS backend
module "ec2" {
  source = "./modules/ec2" # Path to your EC2 module

  # Number of instances, instance type, and other settings
  instance_count = 2
  instance_type  = "t2.micro"
}

# Create an RDS instance for the database
module "rds" {
  source = "./modules/rds" # Path to your RDS module

  # RDS settings such as database engine, size, username, password, etc.
}

# Create a Load Balancer to distribute traffic
module "load_balancer" {
  source = "./modules/load-balancer" # Path to your Load Balancer module

  # Load Balancer settings, listener configurations, etc.
}
