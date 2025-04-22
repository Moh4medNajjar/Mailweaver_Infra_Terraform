resource "aws_launch_template" "my_launch_template" {
  name_prefix   = "ecs-template"
  image_id      = var.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids

  iam_instance_profile {
    name = var.iam_instance_profile_name
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Environment = "Development"
      Application     = "MW"
      Name        = "launch template ASG"
      Owner = "IT PEAC"
    }
  }

  user_data = base64encode(<<-EOF
    #!/bin/bash
    echo ECS_CLUSTER=my-ecs-cluster >> /etc/ecs/ecs.config
  EOF
  )
}




resource "aws_ecs_cluster" "ecs_cluster" {

  name = "my-ecs-cluster"

}
 
resource "aws_ecs_capacity_provider" "ecs_capacity_provider" {

  name = "test1"
 
  auto_scaling_group_provider {

    auto_scaling_group_arn = var.asg_arn
 
    managed_scaling {

      maximum_scaling_step_size = 1000

      minimum_scaling_step_size = 1

      status                    = "ENABLED"

      target_capacity           = 3

    }

  }

}
 
resource "aws_ecs_cluster_capacity_providers" "cluster_capacity_provider" {

  cluster_name = aws_ecs_cluster.ecs_cluster.name
 
  capacity_providers = [aws_ecs_capacity_provider.ecs_capacity_provider.name]
 
  default_capacity_provider_strategy {

    base              = 1

    weight            = 100

    capacity_provider = aws_ecs_capacity_provider.ecs_capacity_provider.name

  }

}
 

//*****************************************************
module "ecs_asg" {
  source                    = "../modules/asg"
  asg_name                  = var.ecs_asg_name
  asg_vpc_zone_identifier   = var.vpc_zone_identifier_table #var.ecs_asg_vpc_zone_identifier #["subnet-07e2b517a5c61cd68"]  #[]
  asg_desired_capacity      = var.ecs_asg_desired_capacity
  asg_max_size              = var.ecs_asg_max_size
  asg_min_size              = var.ecs_asg_min_size
  ecs_asg_health_check_type = "EC2"

  asg_lt_id      = ecs_launch_template.my_launch_template.id
  asg_lt_version = var.ecs_asg_lt_version

  asg_name_tag_value          = var.ecs_asg_tag_name_value
  asg_application_tag_value   = var.ecs_asg_application_tag_value
  asg_environnement_tag_value = var.ecs_asg_environnement_tag_value
  asg_owner_tag_value         = var.ecs_asg_owner_tag_value
  asg_project_tag_value       = var.ecs_asg_project_tag_value

}
//*****************************************************
resource "aws_ecs_task_definition" "ecs_task_definition" {

  family             = var.ecs_task_family

  network_mode       = "awsvpc"

  execution_role_arn = var.execution_role_arn

  cpu                = 256

  runtime_platform {

    operating_system_family = "LINUX"

    cpu_architecture        = "X86_64"

  }

  container_definitions = jsonencode([{

    name      = "dockergs"

    image     = var.container_image

    cpu       = 256

    memory    = 512

    essential = true

    portMappings = [{

      containerPort = var.container_port

      hostPort      = var.container_port

      protocol      = "tcp"

    }]

  }])

}
 
resource "aws_ecs_service" "ecs_service" {

  name            = "my-ecs-service"

  cluster         = aws_ecs_cluster.ecs_cluster.id

  task_definition = aws_ecs_task_definition.ecs_task_definition.arn

  desired_count   = 1
 
  network_configuration {

    subnets         = var.subnet_ids

    security_groups = [var.security_group_id]

  }
 
  force_new_deployment = true
 
  placement_constraints {

    type = "distinctInstance"

  }
 
  triggers = {

    redeployment = timestamp()

  }
 
  capacity_provider_strategy {

    capacity_provider = aws_ecs_capacity_provider.ecs_capacity_provider.name

    weight            = 100

  }
 
  load_balancer {

    target_group_arn = var.target_group_arn

    container_name   = "dockergs"

    container_port   = var.container_port

  }
 
  depends_on = [aws_ecs_capacity_provider.ecs_capacity_provider]

}

 