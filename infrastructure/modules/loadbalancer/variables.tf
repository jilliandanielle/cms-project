variable "lb_name" {
  description = "Name for the Application Load Balancer"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs where the load balancer will be deployed"
  type        = list(string)
}
