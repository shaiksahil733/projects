resource "aws_security_group" "public_sg" {
  vpc_id      = aws_vpc.main.id
  name        = var.public_sg.name
  description = var.public_sg.description
  tags = {
    Name = var.public_sg.name
  }


}
resource "aws_vpc_security_group_ingress_rule" "public_ingress" {
  count             = length(var.public_sg.rules)
  security_group_id = aws_security_group.public_sg.id
  cidr_ipv4         = var.public_sg.rules[count.index].cidr_ipv4
  from_port         = var.public_sg.rules[count.index].from_port
  ip_protocol       = var.public_sg.rules[count.index].ip_protocol
  to_port           = var.public_sg.rules[count.index].to_port

}
resource "aws_vpc_security_group_egress_rule" "public_egress" {
  security_group_id = aws_security_group.public_sg.id
  cidr_ipv4         = local.cidr_block
  ip_protocol       = "-1"
}

resource "aws_security_group" "private_sg" {
  vpc_id      = aws_vpc.main.id
  name        = var.private_sg.name
  description = var.private_sg.description

  tags = {
    Name = var.private_sg.name
  }
}
resource "aws_vpc_security_group_ingress_rule" "private_ingress" {
  count             = length(var.private_sg.rules)
  security_group_id = aws_security_group.private_sg.id
  from_port         = var.private_sg.rules[count.index].from_port
  to_port           = var.private_sg.rules[count.index].to_port
  ip_protocol       = var.private_sg.rules[count.index].ip_protocol

  referenced_security_group_id = aws_security_group.public_sg.id
}
resource "aws_vpc_security_group_egress_rule" "private_egress" {
  security_group_id = aws_security_group.private_sg.id
  cidr_ipv4         = local.cidr_block
  ip_protocol       = "-1"
}