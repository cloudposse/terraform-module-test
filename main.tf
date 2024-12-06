resource "random_integer" "example" {
  count = module.this.enabled ? 1 : 0
  min   = 1
  max   = 20000
  keepers = {
    testing = local.testing ? 1 : 0
    example = var.example
  }
}

locals {
  testing = true
  example = format("%v %v", var.example, join("", random_integer.example[*].result))
}

resource "aws_ssm_parameter" "default" {
  count = module.this.enabled ? 1 : 0
  name  = module.this.id
  type  = "String"
  value = "bar"
}









