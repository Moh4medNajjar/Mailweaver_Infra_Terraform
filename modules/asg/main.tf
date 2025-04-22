resource "aws_autoscaling_group" "asg" {
  name                = var.asg_name
  vpc_zone_identifier = var.asg_vpc_zone_identifier #[aws_subnet.subnet.id, aws_subnet.subnet2.id]
  desired_capacity    = var.asg_desired_capacity  #2
  max_size            = var.asg_max_size #3
  min_size            = var.asg_min_size #1
  health_check_type = var.ecs_asg_health_check_type 

  launch_template {
    id      = var.asg_lt_id
    version = var.asg_lt_version 
  }
 
  tag {
      key = "name"
      value = var.asg_name_tag_value
      propagate_at_launch = false #var.asg_tag_name_propagate_at_launch
    }
  tag {
    key = "application"
    value = var.asg_application_tag_value
    propagate_at_launch = false #var.asg_tag_application_propagate_at_launch
  }

  tag {
    key = "environnement"
    value = var.asg_environnement_tag_value
    propagate_at_launch = false # var.asg_tag_environnement_propagate_at_launch
  }
  tag {
    key = "owner"
    value = var.asg_owner_tag_value
    propagate_at_launch = false #var.asg_tag_owner_propagate_at_launch
  }
  tag {
    key = "project"
    value = var.asg_project_tag_value
    propagate_at_launch = false #var.asg_tag_project_propagate_at_launch
  }





}



