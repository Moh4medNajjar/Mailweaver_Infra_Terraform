output "ecs_cluster_name" {
  description = "Nom du cluster ECS"
  value       = aws_ecs_cluster.ecs_cluster.name
}

output "ecs_cluster_arn" {
  description = "ARN du cluster ECS"
  value       = aws_ecs_cluster.ecs_cluster.arn
}

output "ecs_service_name" {
  description = "Nom du service ECS"
  value       = aws_ecs_service.ecs_service.name
}

output "ecs_service_id" {
  description = "ID du service ECS"
  value       = aws_ecs_service.ecs_service.id
}

output "task_definition_arn" {
  description = "ARN de la task definition"
  value       = aws_ecs_task_definition.ecs_task_definition.arn
}

output "capacity_provider_name" {
  description = "Nom du capacity provider ECS"
  value       = aws_ecs_capacity_provider.ecs_capacity_provider.name
}


output "launch_template_id" {
  value = aws_launch_template.my_launch_template.id
}