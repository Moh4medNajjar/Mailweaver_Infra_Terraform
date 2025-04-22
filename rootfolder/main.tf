module "Mailweaver_VPC" {
  source     = "../modules/vpc"
  cidr_block = var.vpc_cidr
}

module "public_subnet" {
  vpc_id            = module.Mailweaver_VPC.vpc_id
  source            = "../modules/subnet"
  isPublic          = true
  subnet_cidr       = var.public_cidr
  availability_zone = "eu-west-3a"
  subnet_name       = "Mailweaver_public_subnet"
}
module "private_subnet_1" {
  source            = "../modules/subnet"
  vpc_id            = module.Mailweaver_VPC.vpc_id
  isPublic          = false
  subnet_cidr       = var.private_1_cidr
  availability_zone = "eu-west-3a"
  subnet_name       = "Mailweaver_private_subnet_1"
}
module "private_subnet_2" {
  source            = "../modules/subnet"
  vpc_id            = module.Mailweaver_VPC.vpc_id
  isPublic          = false
  subnet_cidr       = var.private_2_cidr
  availability_zone = "eu-west-3b"
  subnet_name       = "Mailweaver_private_subnet_2"
}

module "primary_alb" {
  source              = "../modules/alb"
  alb_name            = var.primary_alb_name
  alb_internal        = var.primary_alb_internal
  alb_security_groups = [module.security_groups.id, module.security_groups.id]
  alb_subnets         = [module.public_subnet_1.subnet_id, module.public_subnet_2.subnet_id] //!!!!!
  alb_tags            = var.networking_tags
  # target group
  alb_target_group_name            = var.primary_alb_tg_name
  alb_target_group_port            = var.primary_alb_tg_port
  alb_target_group_protocol        = var.primary_alb_tg_protocol
  vpc_id                           = module.Mailweaver_VPC.vpc_id
  health_check_healthy_threshold   = var.primary_alb_hc_h_threshold
  health_check_interval            = var.primary_alb_hc_interval
  health_check_path                = var.primary_alb_hc_path
  health_check_timeout             = var.primary_alb_hc_timeout
  health_check_unhealthy_threshold = var.primary_alb_hc_uh_threshold
  #listener
  alb_listener_port     = var.primary_alb_listener_port
  alb_listener_protocol = var.primary_alb_listener_protocol
}


module "ecs_sg" {
  source = "../modules/security_group"

  name                = "ecs-security-group"
  description         = "Security group for ECS cluster"
  vpc_id              = module.vpc.vpc_id
  ingress_from_port   = var.ingress_from_port
  ingress_to_port     = var.ingress_to_port
  ingress_protocol    = var.ingress_protocol
  ingress_cidr_blocks = var.ingress_cidr_blocks
  tags = {
    Environment = "dev"
    Name        = "ecs-security-group"
  }
}

module "ecs_launch_template" {
  source                    = "../modules/launch_template"
  image_id                  = var.image_id
  instance_type             = var.instance_type
  vpc_security_group_ids    = module.ecs_sg.security_group_id
  iam_instance_profile_name = "ecsInstanceRole"
}


module "ecs" {
  source = "../modules/ecs"

  asg_arn            = module.ecs_asg.asg_arn
  subnet_ids         = [module.private_subnet_1.id, module.private_subnet_2.id]
  security_group_id  = module.ecs_security_group.security_group_id
  target_group_arn   = var.target_group_arn //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  execution_role_arn = var.execution_role_arn
}

