variable "name" {
  type        = string
  description = "Security group name"
}
 
variable "description" {
  type        = string
  default     = "Security group for ECS"
}
 
variable "vpc_id" {
  type        = string
  description = "VPC ID where SG will be created"
}
 
variable "ingress_from_port" {
  type        = number
  default     = 0
}
 
variable "ingress_to_port" {
  type        = number
  default     = 0
}
 
variable "ingress_protocol" {
  type        = string
  default     = "-1"
}
 
variable "ingress_cidr_blocks" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
 
variable "tags" {
  type        = map(string)
  default     = {}
}