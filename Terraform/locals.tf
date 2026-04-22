locals {
  cidr_block      = "0.0.0.0/0"
  subnets_public  = length(var.subnets_public)
  subnets_private = length(var.subnets_private)
}