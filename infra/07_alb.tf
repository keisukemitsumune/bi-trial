resource "aws_lb" "this" {
  name               = "${local.general.service_name}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups = [
    aws_security_group.alb.id,
  ]
  subnets = [
    aws_subnet.public1.id,
    aws_subnet.public2.id,
  ]
}

resource "aws_lb_target_group" "this" {
  name     = "${local.general.service_name}-tg"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = aws_vpc.this.id
  health_check {
    path                = "/"
    port                = 3000
    interval            = 300
    timeout             = 10
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = aws_acm_certificate_validation.this.certificate_arn
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

resource "aws_lb_target_group_attachment" "this" {
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = aws_instance.this.id
  port             = 3000
}