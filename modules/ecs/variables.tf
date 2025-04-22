variable "asg_arn" {
  description = "ARN of the Auto Scaling Group to attach to ECS capacity provider"
  type        = string
}
variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group for ECS service"
  type        = string
}
variable "target_group_arn" {
  description = "ARN of the ECS target group"
  type        = string
}
variable "asg_arn" {

  description = "ARN du Auto Scaling Group"

  type        = string

}
 
variable "subnet_ids" {

  description = "Liste des subnets"

  type        = list(string)

}
 
variable "security_group_id" {

  description = "ID du Security Group"

  type        = string

}
 
variable "target_group_arn" {

  description = "ARN du target group pour le load balancer"

  type        = string

}
 
variable "ecs_task_family" {

  description = "Nom du ECS task definition"

  type        = string

  default     = "my-ecs-task"

}
 
variable "execution_role_arn" {

  description = "ARN du rôle d'exécution ECS"

  type        = string

}
 
variable "container_image" {

  description = "Image Docker du container"

  type        = string

  default     = "public.ecr.aws/f9n5f1l7/dgs:latest"

}
 
variable "container_port" {

  description = "Port exposé par le container"

  type        = number

  default     = 80

}

variable "image_id" {
  description = "AMI ID for Amazon Linux in eu-west-2"
  # Replace with the appropriate Amazon Linux AMI ID for eu-west-3
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "vpc_security_group_ids" {
  type = list(string)
}
variable "iam_instance_profile_name" {
  description = " The iam_instance_profile"
  type = string
}


variable "vpc_zone_identifier_table" {
  type = list(string)
}
