variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "ap-south-1"

}

variable "vpc_main" {
  description = "The main VPC for the AWS environment"
  type = object({
    cidr_block = string
  })
  default = {
    cidr_block = "10.0.0.0/16"
  }


}

variable "subnets_public" {
  type = list(object({
    cidr_block        = string
    availability_zone = string
    Name              = string
  }))


}

variable "subnets_private" {
  type = list(object({
    cidr_block        = string
    availability_zone = string
    Name              = string
  }))


}
variable "network_name" {
  type    = string
  default = "sahil"

}

variable "key_pair" {
  type = object({
    name             = string
    public_key_path  = optional(string, "~/.ssh/id_rsa.pub")
    private_key_path = optional(string, "~/.ssh/id_rsa")
  })

}

variable "public_sg" {
  type = object({
    name        = optional(string, "public_SG")
    description = optional(string, "This is security group for web server")
    rules = list(object({
      cidr_ipv4   = optional(string, "0.0.0.0/0")
      from_port   = number #0
      ip_protocol = optional(string, "tcp")
      to_port     = number #0
      }
    ))
  })
  description = "This is security group for web server"
}

variable "private_sg" {
  type = object({
    name        = optional(string, "private_SG")
    description = optional(string, "This is security group for private instances")

    rules = list(object({
      from_port   = number
      to_port     = number
      ip_protocol = optional(string, "tcp")
    }))
  })

  description = "This is security group for private instances"
}

variable "web_image" {
  type = object({
    name = string
    ami_filters = object({
      name  = optional(string, "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*")
      owner = optional(string, "099720109477")
    })
    instance_type               = optional(string, "t3.micro")
    associate_public_ip_address = optional(string, true)
    username                    = optional(string, "ubuntu")
  })

}
