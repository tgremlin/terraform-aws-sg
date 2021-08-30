provider "aws" {
    region = "us-east-1"
}


resource "aws_security_group" "this" {
  for_each    = local.groups

  name        = each.key # top-level key is security group name
  description = each.value.description

  dynamic "ingress" {
    for_each = local.rules[each.key] # List of Maps with rule attributes
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
}
output "security_groups" {
  value = aws_security_group.this
}