data "aws_ami" "web_image" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.web_image.ami_filters.name]
  }
  owners = [var.web_image.ami_filters.owner]

}
