############### main.tf ###############
resource "aws_security_group" "nlb_sg" {
  count       = var.create_sg && var.enable_sg_support ? 1 : 0
  name        = "${local.base_name}-nlb-sg"
  description = "Security group for NLB"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.listeners
    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = var.allowed_cidrs
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    {
      Name = "${local.base_name}-nlb-sg"
    },
    local.common_tags
  )
}

resource "aws_lb" "nlb" {
  name               = "${local.base_name}-nlb"
  internal           = var.internal
  load_balancer_type = "network"
  subnets            = var.subnet_ids
  enable_cross_zone_load_balancing = var.cross_zone_enabled
  enable_deletion_protection = var.enable_deletion_protection


  security_groups = var.enable_sg_support ? (var.create_sg ? [aws_security_group.nlb_sg[0].id] : var.existing_sg_ids) : null

  tags = merge(
    {
      Name = "${local.base_name}-nlb"
    },
   local.common_tags
  )
}

resource "aws_lb_target_group" "tg" {
  for_each = { for l in var.listeners : tostring(l.port) => l }

  name        = "${local.base_name}-tg-${each.key}"
  port        = each.value.target_port
  protocol    = each.value.target_protocol
  target_type = lookup(each.value, "target_type", "instance")
  vpc_id      = var.vpc_id

  health_check {
    protocol            = lookup(each.value, "health_protocol", "TCP")
    port                = lookup(each.value, "health_port", "traffic-port")
    interval            = 30
    timeout             = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

  tags = merge(
    {
      Name = "${local.base_name}-tg-${each.key}"
    },
    local.common_tags
  )
}

resource "aws_lb_listener" "listener" {
  for_each = { for l in var.listeners : tostring(l.port) => l }

  load_balancer_arn = aws_lb.nlb.arn
  port              = each.value.port
  protocol          = each.value.protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg[each.key].arn
  }

  tags = merge(
    {
      Name = "${local.base_name}-listener-${each.key}"
    },
    local.common_tags
  )
}
