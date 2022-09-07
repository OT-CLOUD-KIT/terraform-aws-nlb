variable "nlb_name" {
  type        = string
  description = "Load Balancer name"
  default     = "nlb1"
}

variable "listener_ports" {
  type    = map(number)
  default = {
    http  = 80
    https = 443
  }
}

variable "subnets" {
  type        = list(string)
  description = "A list of subnet ids"
  default      = ["subnet-0e6b22e248549b83e", "subnet-0532fa65231ed74a4"]
}

variable "target_group_instance_id" {
  type        = set(string)
  description = "target group instance id"
  default     = ["i-0dfacbedc80c4fa1a", "i-0707c2bb02b28434c"]
}

variable "tcp_protocol" {
  type        = string
  description = "protocol type"
  default     = "TCP"
  validation {
    condition     = contains(["TCP", "UDP", "TLS"], var.tcp_protocol)
    error_message = "Valid values are \"TCP\",\"UDP\",\"TLS\"."
  }
}

variable "target_type" {
  type        = string
  description = "target type"
  default     = "instance"
}

variable "port" {
  type        = number
  description = "port required"
  default     = 80
}

variable "healthy_threshold" {
  type        = number
  description = "healthy threshold number"
  default     = 2
}

variable "unhealthy_threshold" {
  type        = number
  description = "unhealthy threshold number"
  default     = 2
}

variable "interval" {
  type        = number
  description = "interval number"
  default     = 10
}

variable "matcher" {
  type        = string
  description = "matcher"
  default     = ""
}

variable "load_balancer_type" {
  type        = string
  description = "load balancer type"
  default     = "network"
   validation {
    condition     = contains(["network"], var.load_balancer_type)
    error_message = "Valid values are \"network\"."
  }
}

variable "internal" {
  type        = bool
  description = "internal true or false"
  default     = true
}

variable "default_action_type" {
  type        = string
  description = "default action type"
  default     = "forward"
}

variable "target_group_name" {
  type        = string
  description = "target group name"
  default     = "nlb-target-group"
}

variable "target_group_port" {
  type        = number
  description = "target group port"
  default     = 80
}

variable "vpc_id" {
  type        = string
  description = "vpc id"
  default = "vpc-0c638c6ab0e9479ca"
}

variable "tg_attachement_port" {
  type        = number
  description = "tg attachement port"
  default     = 8080
}

variable "tags" {
  type        = map(string)
  description = "Additional tags"
  default     = {}
}

variable "PROVISIONER" {
  type        = string
  description = "PROVISIONER type value in form of a string"
  default     = "terraform"
}


