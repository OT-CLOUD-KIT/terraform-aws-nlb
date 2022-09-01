# NLB (Network Load Balancer)

[![Opstree Solutions][opstree_avatar]][opstree_homepage]<br/>[Opstree Solutions][opstree_homepage] 

  [opstree_homepage]: https://opstree.github.io/
  [opstree_avatar]: https://img.cloudposse.com/200x100/https://www.opstree.com/images/og_image8.jpg

* Network Load Balancer automatically provides a static IP per Availability Zone (subnet) that can be used by applications as the front-end IP of the load balancer.
* Network Load Balancer also allows you the option to assign an Elastic IP per Availability Zone (subnet) thereby providing your own fixed IP. 

## Usage


```hcl
 module "nlb-internal" {
  source                   = "git::https://github.com/OT-CLOUD-KIT/terraform-aws-nlb.git"
  count                    = var.enable_nlb_resource == true ? 1 : 0
  nlb_name                 = var.nlb_name 
  subnets                  = var.subnets
  subnet_mapping           = var.subnet_mapping
  listener_port            = var.listener_port
  vpc_id                   = var.vpc_id
  target_groups            = var.target_groups
  target_group_instance_id = var.target_group_instance_id
  tcp_protocol             = var.tcp_protocol
  target_type              = var.target_type
  port                     = var.port
  healthy_threshold        = var.healthy_threshold
  unhealthy_threshold      = var.unhealthy_threshold
  interval                 = var.interval
  matcher                  = var.matcher
  load_balancer_type       = var.load_balancer_type
  internal                 = var.internal
  default_action_type      = var.default_action_type 
  target_group_name        = var.target_group_name
  target_group_port        = var.target_group_port
  tg_attachement_port      = var.tg_attachement_port
  tags                     = var.tags
}           
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| nlb_name  | Name used for the NLB resource | `string` | `"nlb1` | yes |
| subnets| A list of subnet ids | `list(string)` | `[]` | yes |
| subnet_mapping| List of objects describing mapping subnets to their allocation IDs | `map(list(string))` | `[]` <br>| no ||
| listener_port | Port on which LB is listening in the form of a number | `number` | `42069` | yes |
| vpc_id | VPC ID | `string` | `"vpc-0ee0ed5cef71f7fb2"` | yes |
| target_groups| Map of target groups to create in the form of a string | `map(object({}))` |`{}`| no |
| target_group_instance_id | target group instance id in the form of a string  | `string` | `"i-08f4ec5db7c523cc6"` | yes |
| tcp_protocol | tcp protocoal | `list(string)` | `"TCP"` | yes |
| target_type| target type | `string` | `"instance"` | yes |
| port| health check port value in the form of a number |   `number` | `80` | yes |
| healthy_threshold | healthy threshold value in the form of a number | `number` | `2` | yes |
| unhealthy_threshold | unhealthy threshold value in the form of a number | `number`|  `2` | yes |
| interval |health check interval value in the form of a number  | `number` | `10` | yes |
| matcher | health check matcher value in the form of a string  | `string` | `n/a`| no |
|load_balancer_type | load balancer type in the form of a string | `string` | `"network"` | yes |
|internal |  is internal or not in the form of a bool | `bool` | `true` |  yes |
|default_action_type| default action type in the form of a string |`string` | `"forward"` |  yes |
| target_group_name | target group name in the form of a string| `string` | `"nlb-target-group"` | yes 
| target_group_port | target group port in the form of a number| `number` | `80` | yes |
| tg_attachement_port  | tg attachement port  in the form of a number| `number` | `8080` | yes |
| tags | Additional tags (e.g. map(`BusinessUnit`,`XYZ`) | `map(string)` | `<map>` | yes |

## Outputs

These defined outputs that can be used within the same service and terraform release.

| Name | Description |
|------|-------------|
| target_group_arn | The ARN associated with the target group on the NLB|
| target_id | target ids attached with the target group on the NLB |
|load_balancer_arn | The ARN associated on the NLB |

## Contributors

![Screenshot from 2022-08-31 11-15-32](https://user-images.githubusercontent.com/98826875/187603118-a9bf0285-01f9-409e-9752-2fec11bc551b.png)


[Shristi Gupta][shristi_homepage]

  [shristi_homepage]: https://gitlab.com/shristi.gupta

  