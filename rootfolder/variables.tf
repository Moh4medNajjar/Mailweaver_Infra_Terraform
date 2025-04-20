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

# --------------------------Test----------------------------------
variable "availability_zones" {
  type    = list(string)
  default = ["eu-west-3a", "eu-west-3b", "eu-west-3c"]
}

variable "bucket_name" {
  type    = string
  default = "cc-tf-demo"
}

variable "table_name" {
  type    = string
  default = "ccTfDemo"
}

variable "ecr_repo_name" {
  type    = string
  default = "demo-app-ecr-repo"
}

variable "demo_app_cluster_name" {
  type    = string
  default = "demo-app-cluster"
}


variable "demo_app_task_famliy" {
  type    = string
  default = "demo-app-task"
}

variable "container_port" {
  type    = number
  default = 3000
}

variable "demo_app_task_name" {
  type    = string
  default = "demo-app-task"
}

variable "ecs_task_execution_role_name" {
  type    = string
  default = "demo-app-task-execution-role"
}

variable "application_load_balancer_name" {
  type    = string
  default = "cc-demo-app-alb"
}

variable "target_group_name" {
  type    = string
  default = "cc-demo-alb-tg"
}

variable "demo_app_service_name" {
  type    = string
  default = "cc-demo-app-service"
}
