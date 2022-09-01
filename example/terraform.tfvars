count                      = true
nlb_name                   = "nlb1"
subnets                    = ["subnet-0db4a62944bf13925", "subnet-0c7d3d413b1af1bd6"]
subnet_mapping             = []
listener_port              = 42069
vpc_id                     = "vpc-0ee0ed5cef71f7fb2"
target_groups              = {}
target_group_instance_id   = "i-08f4ec5db7c523cc6"
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