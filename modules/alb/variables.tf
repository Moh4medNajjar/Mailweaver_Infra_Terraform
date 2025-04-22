variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}
 
variable "alb_internal" {
  description = "Specifies whether the load balancer is internal or not"
  type        = bool
}
 
variable "alb_security_groups" {
  description = "The security group IDs for the ALB"
  type        = list(string)
}
 
variable "alb_subnets" {
  description = "The subnet IDs where the ALB will be deployed"
  type        = list(string)
}
 
variable "alb_target_group_name" {
  description = "The name of the target group"
  type        = string
}
 
variable "alb_target_group_port" {
  description = "Port for the target group"
  type        = number
}
 
variable "alb_target_group_protocol" {
  description = "Protocol for the target group"
  type        = string
}
 
variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}
 
variable "health_check_path" {
  description = "Path for health check"
  type        = string
}
 
variable "health_check_interval" {
  description = "Health check interval in seconds"
  type        = number
}
 
variable "health_check_timeout" {
  description = "Health check timeout in seconds"
  type        = number
}
 
variable "health_check_healthy_threshold" {
  description = "Number of consecutive successful health checks before considering the target healthy"
  type        = number
}
 
variable "health_check_unhealthy_threshold" {
  description = "Number of consecutive failed health checks before considering the target unhealthy"
  type        = number
}
 
variable "alb_listener_port" {
  description = "Port on which the ALB listens"
  type        = number
}
 
variable "alb_listener_protocol" {
  description = "Protocol for the ALB listener"
  type        = string
}
 
variable "alb_tags" {
  description = "Tags for the ALB"
  type        = map(string)
  default     = {}
}