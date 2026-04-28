resource "aws_key_pair" "main_kp" {
  key_name   = var.key_pair.name
  public_key = file(var.key_pair.public_key_path)
}

resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.ntier_public[0].id
  vpc_security_group_ids      = [aws_security_group.ntier_bastion.id]
  key_name                    = "my-keypair"
  associate_public_ip_address = true
}

resource "aws_lb" "ntier_alb" {
  name               = "ntier-alb"
  load_balancer_type = "application"
  internal           = false
  security_groups    = [aws_security_group.ntier_alb.id]

  subnets = [
    aws_subnet.ntier_public[0].id,
    aws_subnet.ntier_public[1].id
  ]

  tags = {
    Name = "ntier-alb"
  }
}


resource "aws_lb_target_group" "ntier_tg" {
  name     = "ntier-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.ntier.id

  health_check {
    path = "/"
    port = "traffic-port"
  }

  tags = {
    Name = "ntier-target-group"
  }
}

resource "aws_lb_listener" "ntier_listener" {
  load_balancer_arn = aws_lb.ntier_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ntier_tg.arn
  }
}



resource "aws_instance" "app" {
  count = 2

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.ntier_private[count.index].id
  vpc_security_group_ids = [aws_security_group.ntier_app.id]
  key_name               = "my-keypair"

  user_data = <<-EOF
  #!/bin/bash
  apt update -y
  apt install nginx -y
  systemctl enable nginx
  systemctl start nginx
  EOF
}



resource "aws_lb_target_group_attachment" "ntier_attach" {
  count            = 2
  target_group_arn = aws_lb_target_group.ntier_tg.arn
  target_id        = aws_instance.app[count.index].id
  port             = 80
}



resource "aws_db_subnet_group" "ntier_db_subnet" {
  name = "ntier-db-subnet-group"

  subnet_ids = [
    aws_subnet.ntier_private[0].id,
    aws_subnet.ntier_private[1].id
  ]

  tags = {
    Name = "ntier-db-subnet-group"
  }
}

resource "aws_db_instance" "ntier_db" {
  identifier             = "ntier-mysql"
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  db_name                = "ntierdb"
  username               = "admin"
  password               = "StrongPassword123!"
  skip_final_snapshot    = true
  publicly_accessible    = false
  db_subnet_group_name   = aws_db_subnet_group.ntier_db_subnet.name
  vpc_security_group_ids = [aws_security_group.ntier_db.id]

  tags = {
    Name = "ntier-rds"
  }
}