resource "random_integer" "example" {
  count   = module.this.enabled ? 1 : 0
  testing = local.testing
  min = 1
  max = 50000
  keepers = {
    example = var.example
  }
}

locals {
  testing = 0
  example = format("%v %v", var.example, join("", random_integer.example[*].result))
}
