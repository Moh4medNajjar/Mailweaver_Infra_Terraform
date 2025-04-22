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

variable "vpc_cidr" {
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

# ------------------CHAIMA---------------------------------------
variable "ecr_mutability" {
  type    = string
  default = "MUTABLE"
}


variable "ecr_lifecycle_rules" {
  type = any
}


variable "ecr_force_delete" {
  type = bool
}
variable "ecr_scan_on_push" {
  type = bool
}
# ------------------/CHAIMA/---------------------------------------

variable "ecs_asg_tag_name_value" {
  type = string
}

variable "ecs_asg_application_tag_value" {
  type = string
}

variable "ecs_asg_environnement_tag_value" {
  type = string
}

variable "ecs_asg_owner_tag_value" {
  type = string
}

variable "ecs_asg_project_tag_value" {
  type = string
}

variable "ecs_asg_name" {
  type    = string
  default = "default_ecs_asg"
}
variable "ecs_asg_vpc_zone_identifier" {
  type = list(string)
  #default = [aws_subnet.subnet.id, aws_subnet.subnet2.id]
}

variable "ecs_asg_desired_capacity" {
  type    = number
  default = 1
}
variable "ecs_asg_health_check_type" {
}
variable "ecs_asg_max_size" {
  type    = number
  default = 1
}

variable "ecs_asg_min_size" {
  type    = number
  default = 1
}


variable "ecs_asg_lt_version" {
  type = string
}



variable "image_id" {
  description = "AMI ID for Amazon Linux in eu-west-3"
  # Replace with the appropriate Amazon Linux AMI ID for eu-west-3
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}



variable "ingress_from_port" {
  description = "Port de début pour la règle ingress"
  type        = number
}

variable "ingress_to_port" {
  description = "Port de fin pour la règle ingress"
  type        = number
}

variable "ingress_protocol" {
  description = "Protocole de la règle ingress"
  type        = string
}

variable "ingress_cidr_blocks" {
  description = "Liste des CIDR autorisées en ingress"
  type        = list(string)
}


variable "tags" {
  description = "Tags à appliquer au security group"
  type        = map(string)
  default     = {}
}

variable "asg_arn" {

  description = "ARN of the Auto Scaling Group"

  type = string

}

variable "subnet_ids" {

  description = "List of subnet IDs for ECS service networking"

  type = list(string)

}

variable "security_group_id" {

  description = "Security group ID for ECS service"

  type = string

}

variable "target_group_arn" {

  description = "ARN of the Target Group for the ECS service"

  type = string

}

variable "execution_role_arn" {

}


variable "primary_alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "primary_alb_internal" {
  description = "Specifies whether the load balancer is internal or not"
  type        = bool
}


variable "primary_alb_tg_name" {
  description = "The name of the target group"
  type        = string
}

variable "primary_alb_tg_port" {
  description = "Port for the target group"
  type        = number
}

variable "primary_alb_tg_protocol" {
  description = "Protocol for the target group"
  type        = string
}

variable "primary_alb_hc_path" {
  description = "Path for health check"
  type        = string
}

variable "primary_alb_hc_interval" {
  description = "Health check interval in seconds"
  type        = number
}

variable "primary_alb_hc_timeout" {
  description = "Health check timeout in seconds"
  type        = number
}

variable "primary_alb_hc_h_threshold" {
  description = "Number of consecutive successful health checks before considering the target healthy"
  type        = number
}

variable "primary_alb_hc_uh_threshold" {
  description = "Number of consecutive failed health checks before considering the target unhealthy"
  type        = number
}

variable "primary_alb_listener_port" {
  description = "Port on which the ALB listens"
  type        = number
}

variable "primary_alb_listener_protocol" {
  description = "Protocol for the ALB listener"
  type        = string
}
variable "networking_tags" {
  type = map(string)
}