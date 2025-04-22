

variable asg_name  {
  type = string
  default = "default_ecs_asg"
}
variable asg_vpc_zone_identifier  {
  type = list(string)
  #default = [aws_subnet.subnet.id, aws_subnet.subnet2.id]
}

variable ecs_asg_health_check_type  {
type = string
}

variable asg_desired_capacity  {
  type = number
  default = 1
}
variable asg_max_size  {
  type = number
  default = 1
}

variable asg_min_size  {
  type = number
  default = 1
}


# ---------------------------
#Launch Template
# ---------------------------
variable asg_lt_id  {
  type = string
  #default = aws_launch_template.ecs_lt.id
}
variable asg_lt_version  {
  type = string
  default = "$Latest"
}

# ---------------------------
# Tag
# ---------------------------

# variable "ecs_asg_tags" {
#   description = "Map of ASG tags to create"
#   type = map(object({
#     key        = string
#     value = string
#     propagate_at_launch    = bool
#   }))
# }







variable asg_name_tag_value  {
type = string
}

# variable tag_name_propagate_at_launch  {
#   type = bool
#   default = false
# }


variable asg_application_tag_value  {
type = string
}

# variable tag_application_propagate_at_launch  {
# type = bool
# default = false
# }



variable asg_environnement_tag_value  {
  type = string
}

# variable tag_environnement_propagate_at_launch  {
# type = bool
# default = false
# }

# var.tag_owner_value
variable asg_owner_tag_value  {
  type = string
  default = "IT PEAC"
}

# variable tag_owner_propagate_at_launch  {
# type = bool
# default = false
# }

variable asg_project_tag_value  {
type = string
}

# variable tag_project_propagate_at_launch  {
# type = bool
# default = false
# }




# variable asg_tag_key  {
#   type = string
#   default = "foo"
# }
#
# variable asg_tag_value  {
#   type = string
#   default = "bar"
# }
#
# variable asg_tag_propagate_at_launch  {
#   type = bool
#   default = false
# }


#this determines if the attach resource is created or not
# variable attach_lb  {
# type = bool
# default = false
# }