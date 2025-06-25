vpc_id = "vpc-0bfa15004ff55e107"
region = "us-east-1"
subnet_ids = [
  "subnet-08a2aa30dbc179a2b",
  "subnet-0a49bf4221b5f0107"
]

internal           = false
cross_zone_enabled = true

create_sg                  = true
enable_sg_support          = true
existing_sg_ids            = []
enable_deletion_protection = false


allowed_cidrs = [
  "0.0.0.0/0"
]

listeners = [
  {
    port            = 80
    protocol        = "TCP"
    target_port     = 80
    target_protocol = "TCP"
    health_protocol = "TCP"
    health_port     = "80"
  }
]


################## Naming Convension #####################

random_alphanumeric_len = 4

bu       = "ot"
app      = "bp"
env      = "d"
resource = "NLB"
tenant   = ""

special = false
upper   = false
number  = true

gen_no_of_names = 1

team    = "devops"
program = "ot"

