resource "aws_route_table" "pub_routeT" {
  count  = local.subnets_public != 0 ? 1 : 0
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = local.cidr_block
    gateway_id = aws_internet_gateway.main_igw.id
  }

  tags = {
    Name = "${var.network_name}-public"
  }
}
resource "aws_route_table" "pri_routeT" {
  count  = local.subnets_private != 0 ? 1 : 0
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.network_name}-private"
  }


}
