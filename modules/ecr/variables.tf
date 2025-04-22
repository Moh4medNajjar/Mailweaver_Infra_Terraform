variable "ecr_repo_name" {
  description = "Mailweaver ECR repo name"
  type = string
}


variable ecr_mutability  {
  type = string
  default = "MUTABLE"
}


variable ecr_lifecycle_rules  {
  type = any
}


variable ecr_force_delete  {
  type = bool
}
variable ecr_scan_on_push  {
  type = bool
}