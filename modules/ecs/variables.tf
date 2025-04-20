# variable "mailweaver_ecs_cluster" {
#   description = "Mailweaver ecs cluster name"
#   type = string
# }
# variable "demo_app_task_family" {
#   description = "demo_app_task_family"
#   type = string
# }
# variable "demo_app_task_name" {
#   description = "demo_app_task_name"
#   type = string
# }
# variable "ecr_repo_url" {
#   description = "ecr_repo_url"
#   type = string
# }
# variable "container_port" {
#   description = "container_port"
#   type = string
# }
# variable "mailweaver_ecs_task_execution_role_name" {
#   description = "mailweaver_ecs_task_execution_role_name"
#   type = string
# }
# variable "mailweaver_alb_name" {
#   description = "mailweaver_alb_name"
#   type = string
# }
# variable "target_group_name" {
#   description = "target_group_name"
#   type = string
# }
# variable "demo_app_service_name" {
#   description = "target_group_name"
#   type = string
# }

# variable "availability_zones" {
#   type = list(string)
# }

variable "demo_app_cluster_name" {
  description = "ECS Cluster Name"
  type        = string
}

variable "availability_zones" {
  description = "us-east-1 AZs"
  type        = list(string)
}

variable "demo_app_task_famliy" {
  description = "ECS Task Family"
  type        = string
}

variable "ecr_repo_url" {
  description = "ECR Repo URL"
  type        = string
}

variable "container_port" {
  description = "Container Port"
  type        = number
}

variable "demo_app_task_name" {
  description = "ECS Task Name"
  type        = string
}

variable "ecs_task_execution_role_name" {
  description = "ECS Task Execution Role Name"
  type        = string
}

variable "application_load_balancer_name" {
  description = "ALB Name"
  type        = string
}

variable "target_group_name" {
  description = "ALB Target Group Name"
  type        = string
}

variable "demo_app_service_name" {
  description = "ECS Service Name"
  type        = string
}