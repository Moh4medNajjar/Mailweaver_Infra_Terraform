# module "Mailweaver_VPC" {
#   source     = "../modules/vpc"
#   cidr_block = var.cidr_block
# }

# module "public_subnet" {
#   vpc_id            = module.Mailweaver_VPC.vpc_id
#   source            = "../modules/subnet"
#   isPublic          = true
#   subnet_cidr       = var.public_cidr
#   availability_zone = "eu-west-3a"
#   subnet_name       = "Mailweaver_public_subnet"
# }
# module "private_subnet_1" {
#   source            = "../modules/subnet"
#   vpc_id            = module.Mailweaver_VPC.vpc_id
#   isPublic          = false
#   subnet_cidr       = var.private_1_cidr
#   availability_zone = "eu-west-3a"
#   subnet_name       = "Mailweaver_private_subnet_1"
# }
# module "private_subnet_2" {
#   source            = "../modules/subnet"
#   vpc_id            = module.Mailweaver_VPC.vpc_id
#   isPublic          = false
#   subnet_cidr       = var.private_2_cidr
#   availability_zone = "eu-west-3b"
#   subnet_name       = "Mailweaver_private_subnet_2"
# }
# module "private_subnet_3" {
#   source            = "../modules/subnet"
#   vpc_id            = module.Mailweaver_VPC.vpc_id
#   isPublic          = false
#   subnet_cidr       = var.private_3_cidr
#   availability_zone = "eu-west-3c"
#   subnet_name       = "Mailweaver_private_subnet_3"
# }

# module "mailweaver_VPC_IGW" {
#   source = "../modules/igw"
#   vpc_id = module.Mailweaver_VPC.vpc_id
# }

# //*************************************************************
# module "eip" {
#   source = "../modules/eip"
# }

# module "mailweaver_nat_gateway" {
#   source        = "../modules/nat-gateway"
#   allocation_id = module.eip.eip_id
#   subnet_id     = module.public_subnet.subnet_id
#   igw_id        = module.mailweaver_VPC_IGW.mailweaver_VPC_IGW_id
# }

# //*************************************************************
# module "mailweaver_VPC_public_route_table" {
#   source = "../modules/public-route-table"
#   vpc_id = module.Mailweaver_VPC.vpc_id
#   igw_id = module.mailweaver_VPC_IGW.mailweaver_VPC_IGW_id
# }
# module "mailweaver_VPC_private_route_table" {
#   source    = "../modules/private-route-table"
#   vpc_id    = module.Mailweaver_VPC.vpc_id
#   nat_gw_id = module.mailweaver_nat_gateway.aws_nat_gateway_id
# }

# module "public_subnet_public_route_table_association" {
#   source         = "../modules/route-table-association"
#   subnet_id      = module.public_subnet.subnet_id
#   route_table_id = module.mailweaver_VPC_public_route_table.aws_public_route_table_id
# }
# module "private_subnet_1_private_route_table_association" {
#   source         = "../modules/route-table-association"
#   subnet_id      = module.private_subnet_1.subnet_id
#   route_table_id = module.mailweaver_VPC_private_route_table.aws_private_route_table_id
# }
# module "private_subnet_2_private_route_table_association" {
#   source         = "../modules/route-table-association"
#   subnet_id      = module.private_subnet_2.subnet_id
#   route_table_id = module.mailweaver_VPC_private_route_table.aws_private_route_table_id
# }
# module "private_subnet_3_private_route_table_association" {
#   source         = "../modules/route-table-association"
#   subnet_id      = module.private_subnet_3.subnet_id
#   route_table_id = module.mailweaver_VPC_private_route_table.aws_private_route_table_id
# }

//-------------------------ECR------------------------------------------------------

module "demo_ecr_repo" {
  source        = "../modules/ecr"
  ecr_repo_name = "demo-app-ecr-repo"
}

//-------------------------ECS------------------------------------------------------

module "ecsCluster" {
  source = "../modules/ecs"

  demo_app_cluster_name = var.demo_app_cluster_name
  availability_zones    = var.availability_zones

  demo_app_task_famliy         = var.demo_app_task_famliy
  ecr_repo_url                 = module.demo_ecr_repo.mailweaver_ecr_repo_url
  container_port               = var.container_port
  demo_app_task_name           = var.demo_app_task_name
  ecs_task_execution_role_name = var.ecs_task_execution_role_name

  application_load_balancer_name = var.application_load_balancer_name
  target_group_name              = var.target_group_name
  demo_app_service_name          = var.demo_app_service_name
}
