count                      = true
nlb_name                   = "nlb1"
subnets                    = []
vpc_id                     = ""
target_group_instance_id   = []
tcp_protocol               = ["TCP"]
target_type                = "instance"
 port                       = 80
healthy_threshold          = 2
unhealthy_threshold        = 2
interval                   = 10
matcher                    = ""
load_balancer_type         = "network" 
internal                   = true
default_action_type        = "forward"
target_group_name          = "nlb-target-group"
target_group_port          = 80
tg_attachement_port        = 8080
PROVISIONER                = "terraform"
tags = {
  "team" : "devops"
  "service" : "dynamodb"
}
listener_ports = { 
    http  = 80
    https = 443
  }