resource "aws_internet_gateway" "mailweaver_VPC_IGW" {
  vpc_id = var.vpc_id

  tags = {
    Name = "mailweaver_VPC_IGW"
    Owner = "IT PEAC"
    Application = "Networking"
    Project = "Mailweaver"
  }
}