resource "aws_vpc" "main" {
  cidr_block = var.vpc_main.cidr_block
  tags = {
    Name = "${var.network_name}-vpc"
  }
}
