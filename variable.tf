variable "nlb_name" {
  type        = string
  description = "Load Balancer name"
  default     = "nlb1"
}

variable "listener_port" {
  type        = number
  description = "Port on which LB is listening"
  default     = 42069
}

variable "subnets" {
  type        = list(string)
  description = "A list of subnet ids"
  default     = ["subnet-0db4a62944bf13925", "subnet-0c7d3d413b1af1bd6"]
}

variable "subnet_mapping" {
  type = list(object({
    subnet_id     = string
    allocation_id = string
  }))
  description = "List of objects describing mapping subnets to their allocation IDs"
  default     = []
}

variable "target_groups" {
  type = map(object({
    name   = string
    port   = number
    vpc_id = string
  }))
  description = "Map of target groups to create"
  default     = {}
}

variable "target_group_instance_id" {
  type        = string
  description = "target group instance id"
  default     = "i-08f4ec5db7c523cc6"
}

variable "tcp_protocol" {
  type        = string
  description = "protocol type"
  default     = "TCP"
  validation {
    condition     = contains(["TCP", "UDP", "TLS"], var.tcp_protocol)
    error_message = "Valid values are \"tcp\",\"UDP\",\"TLS\"."
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
  default     = "vpc-0ee0ed5cef71f7fb2"
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