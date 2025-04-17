output "vpc_id" {
  value       = aws_vpc.mailweaver_vpc.id
  description = "The ID of the main VPC"
}
