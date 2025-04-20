resource "aws_ecr_repository" "mailweaver_ecr" {
  name = var.ecr_repo_name

  tags = {
    Name        = "mailweaver_ecr"
    Owner       = "IT PEAC"
    Application = "Mailweaver"
  }
}