variable "key_pair" {
  type = object({
    name             = string
    public_key_path  = optional(string, "~/.ssh/id_rsa.pub")
    private_key_path = optional(string, "~/.ssh/id_rsa")
  })

}

variable "web_image" {
  type = object({
    name = string
    ami_filters = object({
      name  = optional(string, "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*")
      owner = optional(string, "099720109477")
    })
    instance_type = string
    username      = optional(string, "ubuntu")
  })

}
variable "security_groups" {
  type = object({
    ingress = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))

    egress = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
  })
}