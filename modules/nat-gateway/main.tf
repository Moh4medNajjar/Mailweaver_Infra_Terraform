resource "aws_nat_gateway" "mailweaver_nat_gateway" {
  allocation_id = var.allocation_id
  subnet_id     = var.subnet_id

  tags = {
    Name        = "mailweaver_nat_gw"
    Owner       = "IT PEAC"
    Application = "Networking"
    Project     = "Mailweaver"
  }

  depends_on = [var.igw_id] 
}