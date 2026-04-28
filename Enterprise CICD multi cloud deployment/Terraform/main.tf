resource "aws_key_pair" "main_kp" {
  key_name   = var.key_pair.name
  public_key = file(var.key_pair.public_key_path)



}
provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "web_sg" {
  name        = "web-security-group"
  description = "Web server security group"

  dynamic "ingress" {
    for_each = var.security_groups.ingress

    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.security_groups.egress

    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = {
    Name = "web-sg"
  }
}

resource "aws_instance" "web_server" {
  ami             = data.aws_ami.web_image.id
  instance_type   = var.web_image.instance_type
  security_groups = [aws_security_group.web_sg.name]
  key_name        = aws_key_pair.main_kp.key_name

  tags = {
    Name = var.web_image.name
  }
}