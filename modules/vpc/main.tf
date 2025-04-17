resource "aws_vpc" "mailweaver_vpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "mailweaver_vpc"
    Owner = "IT PEAC"
    Application = "Networking"
    Project = "Mailweaver"
  }
}