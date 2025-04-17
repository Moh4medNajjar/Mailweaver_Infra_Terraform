resource "aws_eip" "mailweaver_vpc_eip" {

  tags = {
    Name        = "mailweaver_eip"
    Owner       = "IT PEAC"
    Application = "Networking"
    Project     = "Mailweaver"
  }
}