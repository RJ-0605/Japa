
resource "aws_lb" "rodney-real-Hashi-aws_lb" {

  count = var.rodney_one_resource ? "0" : "1"

  name               = var.r_load_balancer_details.name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.rodney-real-Hashi-security-group.id]
  subnets            = [for subs in aws_subnet.rodney-real-Hashi-subnets: subs.id]

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}


resource "aws_alb_listener" "rodney-real-Hashi-aws-listener_http" {

  count = var.rodney_one_resource ? "0" : "1"
  load_balancer_arn = aws_lb.rodney-real-Hashi-aws_lb[count.index].arn

  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.rodney-real-Hash-targ-group[count.index].arn
    type             = "forward"
  }
}