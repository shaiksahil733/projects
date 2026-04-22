resource "aws_subnet" "main_subnet_pub" {
  count             = local.subnets_public
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnets_public[count.index].cidr_block
  availability_zone = var.subnets_public[count.index].availability_zone
  tags = {
    Name = var.subnets_public[count.index].Name
  }
  depends_on = [aws_vpc.main]
}
resource "aws_subnet" "main_subnet_private" {
  count             = local.subnets_private
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnets_private[count.index].cidr_block
  availability_zone = var.subnets_private[count.index].availability_zone
  tags = {
    Name = var.subnets_private[count.index].Name
  }
  depends_on = [aws_vpc.main]
}
