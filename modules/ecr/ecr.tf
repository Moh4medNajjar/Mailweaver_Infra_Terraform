resource "aws_ecr_repository" "mailweaver_ecr" {
  name = var.ecr_repo_name

  tags = {
    Name        = "mailweaver_ecr"
    Owner       = "IT PEAC"
    Application = "Mailweaver"
  }
}

module ecr {
  source = "../modules/ecr"

  ecr_repo_name  = "mailwaiver_integration_repository"

  ecr_repo_force_delete = var.ecr_force_delete #false
  ecr_repo_mutability = var.ecr_mutability
  ecr_repo_scan_on_push = var.ecr_scan_on_push #true
  # ecr_repo_policy = module.ecr_repository_policy.iam_policy_arn
  ecr_lifecycle_policy = var.ecr_lifecycle_rules
  ecr_repo_tags = var.storage_tags
}