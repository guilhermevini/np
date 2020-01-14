resource "aws_alb" "alb" {
  internal                   = false
  security_groups            = ["${var.sg}"]
  subnets                    = ["${var.subnets}"]
  enable_deletion_protection = false
  name                       = "alb-neon"

  tags {
    Name = "alb-neon"
  }
}

resource "aws_alb_listener" "web-http" {
  load_balancer_arn = "${aws_alb.alb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.web.arn}"
    type             = "forward"
  }
}

resource "aws_alb_target_group" "web" {
  protocol             = "HTTP"
  port                 = 80
  vpc_id               = "${var.vpc}"
  deregistration_delay = 20
  slow_start           = 0

  stickiness {
    type = "lb_cookie"
  }

  health_check {
    protocol            = "HTTP"
    path                = "/"
    port                = "traffic-port"
    healthy_threshold   = 3
    unhealthy_threshold = 5
    timeout             = 5
    interval            = 15
    matcher             = "200"
  }

  name = "tg-p80"

  tags {
    Name = "tg-p80"
  }
}