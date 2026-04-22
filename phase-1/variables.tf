variable "ntier_provider" {
  type = object({
    region = optional(string, "ap-south-1")
  })

}

variable "ntier_vpc" {
  type = object({
    cidr_block = optional(string, "10.0.0.0/16")
    subnets_public = list(object({
      cidr_block = string
      availability_zone         = string
      Name       = string
    }))
    subnets_private = list(object({
      cidr_block = string
      availability_zone        = string
      Name       = string
    }))
  })
}

variable "network_name" {
  type    = string
  default = "ntier"
}