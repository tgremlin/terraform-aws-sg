locals {
  groups = {
    example0 = {
      description = "sg description 0"
    },
    example1 = {
      description = "sg description 1"
    }
  }

  rules = {
    example0 = [{
      description = "rule description 0",
      port = 80,
      cidr_blocks = ["10.0.0.0/16"],
    },{
      description = "rule description 1",
      port = 81,
      cidr_blocks = ["10.1.0.0/16"],
    }]
    example1 = [{
      description = "rule description 0",
      port = 80,
      cidr_blocks = ["10.2.0.0/16"],
    },{
      description = "rule description 1",
      port = 81,
      cidr_blocks = ["10.3.0.0/16"],
    }]
  }
}
