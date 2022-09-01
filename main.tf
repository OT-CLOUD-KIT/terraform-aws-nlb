resource "aws_lb_target_group_attachment" "tg_attachement" {
  target_group_arn = aws_lb_target_group.tg_ip.arn
  target_id        = var.target_group_instance_id
  port             = var.tg_attachement_port
}

resource "aws_lb_target_group" "tg_ip" {
  name        = var.target_group_name
  port        = var.target_group_port
  vpc_id      = var.vpc_id
  protocol    = var.tcp_protocol
  target_type = var.target_type

  health_check {
    port                = var.port
    protocol            = var.tcp_protocol
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    interval            = var.interval
    matcher             = var.matcher
  }
}

resource "aws_lb" "nlb-internal" {
  subnets            = var.subnets
  name               = var.nlb_name
  load_balancer_type = var.load_balancer_type
  internal           = var.internal
  tags = merge(
    {
      PROVISIONER = var.PROVISIONER,

    },
    var.tags,
  )
}


resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.nlb-internal.arn
  port              = var.listener_port
  protocol          = var.tcp_protocol

  default_action {
    target_group_arn = aws_lb_target_group.tg_ip.arn
    type             = var.default_action_type
  }
}
