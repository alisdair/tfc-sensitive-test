terraform {
  experiments      = [sensitive_variables]
  required_version = ">=0.14.0-alpha20201007"
}

variable "password" {
  type      = string
  sensitive = true
  default   = "hunter2"
}

resource "random_pet" "pet" {
  prefix = title(var.password)
  length = 3
}

resource "null_resource" "none" {
  triggers = {
    secret = var.password
  }
}

output "pet" {
  value = random_pet.pet.id
}

output "password" {
  value     = var.password
  sensitive = true
}
