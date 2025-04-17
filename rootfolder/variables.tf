variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-3"
}

variable "aws_profile" {
  description = "AWS CLI profile"
  type        = string
  default     = "mohamed"
}

variable "cidr_block" {
  description = "Mailweaver VPC CIDR block"
  type        = string
}
variable "public_cidr" {
  description = "public subnet cidr"
  type        = string
}
variable "private_1_cidr" {
  description = "private subnet 1 cidr"
  type        = string
}
variable "private_2_cidr" {
  description = "private subnet 2 cidr"
  type        = string
}
variable "private_3_cidr" {
  description = "private subnet 3 cidr"
  type        = string
}
