resource "aws_alb_target_group" "rodney-real-Hash-targ-group" {

  count = var.rodney_one_resource ? "0" : "1"

  name     = var.r_target_group_details.name
  port     = var.r_target_group_details.port
  protocol = var.r_target_group_details.protocol
  vpc_id   = aws_vpc.rodney-real-Hashi-vpc.id
  stickiness {
    type = "lb_cookie"
  }
  # Alter the destination of the health check to be the login page.
  health_check {
    path = "/"
    port = 80
  }
}


resource "aws_lb_target_group_attachment" "rodney-real-Hash-targ-group_attachment" {

  count =  var.rodney_one_resource ? "0" : "${length(var.rodney_aws_instances)}"
  
  target_group_arn = aws_alb_target_group.rodney-real-Hash-targ-group[0].arn
  target_id        = "${var.rodney_aws_instances[count.index].id}"
  port             = 80
}

