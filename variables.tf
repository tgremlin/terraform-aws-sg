variable "groups" {
  default = {
    example0 = {
      description = "sg description 0"
    },
    example1 = {
      description = "sg description 1"
    }
  }
}
variable "rules" {
  default = {
    example0 = [{
      description      = "rule description 0"
      to_port          = 80
      from_port        = 80
      cidr_blocks      = ["10.0.0.0/16"]
    },{
      description      = "rule description 1"
      to_port          = 80
      from_port        = 80
      cidr_blocks      = ["10.1.0.0/16"]
    }]
    example1 = [] # empty Array removes rules
  }
}
locals {
  rules = {
    for k,v in var.rules:
      k => [
        for i in v:
        merge({
          ipv6_cidr_blocks = null
          prefix_list_ids  = null
          security_groups  = null
          protocol         = "tcp"
          self             = null
        }, i)
      ]
  }
}