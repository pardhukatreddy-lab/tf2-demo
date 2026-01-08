
# Provider / Global Settings
project_id = "pelagic-plexus-482016-s2"
region     = "asia-south2"
zone       = "asia-south2-b"

# Network Settings
network_name = "priv-vpc"
subnet_cidr  = "10.10.0.0/24"

# Module Inputs
router_name    = "private-router"
nat_name       = "private-nat"
name_prefix    = "private-lb" # This prefix is used for the LB, MIG, etc.
machine_type   = "e2-micro"
instance_count = 2

# Instance tags (must include lb-backend for LB traffic and ssh-iap for IAP SSH)
vm_tags = ["lb-backend", "ssh-iap"]

## Debian image details 
image_family = "debian-12"
image_project = "debian-cloud"

