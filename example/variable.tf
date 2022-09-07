variable "nlb_name" {
  type        = string
  description = "Load Balancer name"  
}

variable "enable_nlb_resource" {
  type = bool
  description = "enable nlb resource"
}

variable "subnets" {
  type = list(string)
  description = "subnet id"
}

variable "listener_ports" {
  type    = map(number)
}

variable "vpc_id" {
  type = string 
  description = "vpc id"  
}

variable "target_group_instance_id" {
  type = set(string)
  description = "target group instance id"  
}

variable "tcp_protocol" {
  type = string 
  description = "protocol type"
}

variable "target_type" {
  type = string 
  description = "target type"
}

variable "port" {
 type = number
 description = "port required"
}

variable "healthy_threshold" {
  type = number
  description = "healthy threshold number" 
}

variable "unhealthy_threshold"{
  type = number
  description = "unhealthy threshold number"
}

variable "interval" {
  type = number
  description = "interval number"
}

variable "matcher" {
 type = string
 description = "matcher" 
}

variable "load_balancer_type" {
  type = string
  description = "load balancer type" 
}

variable "internal" {
  type = bool
  description = "internal true or false" 
}

variable "default_action_type" {
  type = string
  description = "default action type" 
}

variable "target_group_name" {
  type = string
  description = "target group name" 
}

variable "target_group_port" {
  type = number
  description = "target group port"   
}

variable "vpc_id" {
  type = string
  description = "vpc id" 
}

variable "tg_attachement_port" {
  type  = number
  description = "tg attachement port" 
}

variable "tags" {
  type        = map(string)
  description = "Additional tags"
  default     = {}
}

variable "PROVISIONER" {
  type = string
  description = "PROVISIONER type value in form of a string"
}

