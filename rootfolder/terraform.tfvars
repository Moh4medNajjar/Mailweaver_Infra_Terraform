vpc_cidr = "10.0.0.0/16"
# public_cidr    = "10.0.0.0/18"
# private_1_cidr = "10.0.64.0/18"
# private_2_cidr = "10.0.128.0/18"
# private_3_cidr = "10.0.192.0/18"




ecr_scan_on_push = true
ecr_force_delete = false
ecr_mutability   = "MUTABLE"
#here define multiple blocks for multiple rules
ecr_lifecycle_rules = {
  rules = [
    {
      rulePriority = 1
      description  = "Keep only 10 images"
      selection = {
        countType     = "imageCountMoreThan"
        countNumber   = 10
        tagStatus     = "tagged"
        tagPrefixList = ["prod"]
      }
      action = {
        type = "expire"
      }
    },
    {
      rulePriority : 2,
      description : "Expire images older than 3 months",
      selection : {
        tagStatus : "tagged",
        tagPrefixList = ["prod"],
        countType : "sinceImagePushed",
        countUnit : "days",
        countNumber : 90
      },
      action : {
        type : "expire"
      }
    }
  ]
}


private_1_cidr = "10.0.0.0/18"
private_2_cidr = "10.0.64.0/18"
private_3_cidr = "10.0.128.0/18"
public_cidr    = "10.0.192.0/18"



ecs_asg_name                = "testing_asg_creation"
ecs_asg_vpc_zone_identifier = ["subnet-07e2b517a5c61cd68"]
ecs_asg_desired_capacity    = 2
ecs_asg_max_size            = 3
ecs_asg_min_size            = 2
ecs_asg_lt_version          = "$Latest"

ecs_asg_tag_name_value          = ""
ecs_asg_application_tag_value   = "Networking"
ecs_asg_environnement_tag_value = "integ"
ecs_asg_owner_tag_value         = "IT PEAC"
ecs_asg_project_tag_value       = "mailweaver"
ecs_asg_health_check_type       = "EC2"



image_id      = "ami-00c71bd4d220aa22a"
instance_type = "t2.micro"


# Règles d'ingress

ingress_from_port = 0

ingress_to_port = 0

ingress_protocol = "-1"

ingress_cidr_blocks = ["0.0.0.0/0"]




tags = {

  Environment = "dev"

  Project = "ECS"

  Name = "ecs-security-group"

}


execution_role_arn   = "arn:aws:iam::532199187081:role/ecsTaskExecutionRole"
primary_alb_name     = "mailweaver_primary_alb"
primary_alb_internal = false

# target group
primary_alb_tg_name         = "mailweaver_primary_target_group"
primary_alb_tg_port         = 80     #0
primary_alb_tg_protocol     = "http" #""
primary_alb_hc_h_threshold  = 300    #0
primary_alb_hc_interval     = 300    #0
primary_alb_hc_path         = "/"
primary_alb_hc_timeout      = 300 #0
primary_alb_hc_uh_threshold = 300 #0
#listener
primary_alb_listener_port     = 80
primary_alb_listener_protocol = "http"

networking_tags = {

  name = "..." # change before apply

  application = "Networking"

  environnement = "integ"

  owner = "IT PEAC"

  project = "mailweaver"

}
 