resource "aws_route_table_association" "pri_routeT_asso" {
  count          = local.subnets_private
  subnet_id      = aws_subnet.main_subnet_private[count.index].id
  route_table_id = aws_route_table.pri_routeT[0].id

}
resource "aws_route_table_association" "pub_routeT_asso" {
  count          = local.subnets_public
  subnet_id      = aws_subnet.main_subnet_pub[count.index].id
  route_table_id = aws_route_table.pub_routeT[0].id
}
