resource "aws_security_group" "cms_security_group" {
  name        = "cms-security-group"
  description = "Security group for the CMS backend"

  # Ingress rules (inbound traffic)
  # Example: Allowing incoming HTTP and SSH traffic
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP traffic from anywhere

    # To restrict access to specific IPs, replace "0.0.0.0/0" with the desired IP or IP range.
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["your-ip-address/32"] # Example: Allowing SSH traffic from a specific IP

    # You can define more ingress rules as needed for your application.
  }

  # Egress rules (outbound traffic)
  # Example: Allowing all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"] # Allow traffic to anywhere
  }

  # Tags (optional)
  tags = {
    Name = "CMS Security Group"
  }
}
