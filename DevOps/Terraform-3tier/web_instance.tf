resource "aws_instance" "public" {
  ami                         = data.aws_ami.web_image.id
  instance_type               = var.web_image.instance_type
  associate_public_ip_address = var.web_image.associate_public_ip_address
  key_name                    = aws_key_pair.main_kp.key_name
  tags = {
    Name = var.web_image.name
  }
  subnet_id              = aws_subnet.main_subnet_pub[0].id
  vpc_security_group_ids = [aws_security_group.public_sg.id]
  #   connection {
  #     type        = "ssh"
  #     user = var.web_image.username
  #     private_key = file(var.key_pair.private_key_path)
  #     host = aws_instance.public.public_ip
  #   }


}
resource "aws_key_pair" "main_kp" {
  key_name   = var.key_pair.name
  public_key = file(var.key_pair.public_key_path)



}