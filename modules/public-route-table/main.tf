resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name = "mailweaver_public_route_table"
    Owner = "IT PEAC"
    Application = "Networking"
    Project = "Mailweaver"
  }
}
