resource "aws_subnet" "subnet" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet_cidr
  availability_zone = var.availability_zone
  map_public_ip_on_launch = var.isPublic ? true : false


  tags = {
    Name = var.subnet_name
    Owner = "IT PEAC"
    Application = "Networking"
    Project = "Mailweaver"
    isPublic = var.isPublic
  }
}