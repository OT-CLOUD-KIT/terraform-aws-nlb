variable "vpc_id" {
  type        = string
  description = "VPC ID where the NLB will be deployed"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for NLB"
}

variable "internal" {
  type        = bool
  default     = false
  description = "Whether the NLB is internal or internet-facing"
}

variable "cross_zone_enabled" {
  type        = bool
  default     = true
  description = "Enable cross-zone load balancing for NLB"
}

variable "listeners" {
  type = list(object({
    port              = number
    protocol          = string             # TCP or TLS
    target_port       = number
    target_protocol   = string             # TCP or TLS
    target_type       = optional(string)   # instance | ip | lambda
    health_protocol   = optional(string)   # TCP or HTTP
    health_port       = optional(string)   # port number or 'traffic-port'
  }))
  description = "Listener and target group configurations"
}

variable "allowed_cidrs" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "CIDR blocks allowed in NLB security group ingress"
}

variable "create_sg" {
  type        = bool
  default     = false
  description = "Whether to create a new security group for NLB"
}

variable "enable_sg_support" {
  type        = bool
  default     = false
  description = "Enable security group support for NLB (only valid if NLB is attached to IP targets or PrivateLink)"
}

variable "existing_sg_ids" {
  type        = list(string)
  default     = []
  description = "Existing security group IDs to use if create_sg is false"
}



################################### Naming convention variables #########################################

variable "bu" {
  description = "Business unit name (e.g., BP, GURUKU). Max 6 characters."
  type        = string

  validation {
    condition     = length(var.bu) <= 6
    error_message = "The business unit name must be less than or equal to 6 characters."
  }
}

variable "program" {
  description = "Name of the program (e.g., OT, BP)."
  type        = string
}

variable "app" {
  description = "Application name (e.g., network, shared). Max 6 characters."
  type        = string

  validation {
    condition     = length(var.app) <= 6
    error_message = "The app name must be less than or equal to 6 characters."
  }
}

variable "env" {
  description = "Environment code: 'd' (dev), 'p' (prod), 'q' (qa), 's' (stage), 'g' (global)."
  type        = string

  validation {
    condition     = contains(["d", "p", "q", "s", "g"], var.env)
    error_message = "env must be one of 'd', 'p', 'q', 's', 'g'."
  }
}

variable "team" {
  description = "Team email responsible for the application (e.g., digitalops@gehealthcare.com)."
  type        = string
}

variable "region" {
  description = "AWS region (e.g., us-east-1, ap-south-1)."
  type        = string
}


variable "enable_deletion_protection" {
  description = "Enable deletion protection for ALB"
  type        = bool
  default     = true
}