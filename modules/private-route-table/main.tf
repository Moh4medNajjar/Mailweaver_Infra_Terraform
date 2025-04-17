resource "aws_route_table" "private_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.nat_gw_id
  }

  tags = {
    Name        = "mailweaver_private_route_table"
    Owner       = "IT PEAC"
    Application = "Networking"
    Project     = "Mailweaver"
  }
}
