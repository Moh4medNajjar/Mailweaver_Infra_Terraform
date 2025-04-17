variable "vpc_id" {
  description = "VPC ID to associate the route table with"
  type        = string
}

variable "igw_id" {
  description = "Internet Gateway ID"
  type        = string
}
