terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

variable "instances" {
  type = number
}

variable "prefix" {
  type = string
}

variable "length" {
  type = string
}

variable "separator" {
  type = string
}

 resource "random_pet" "pet" {
  count     = var.instances
  prefix    = var.prefix
  length    = var.length
  separator = var.separator
 }

output "random_pet_kind" {
  value = random_pet.pet[*].id
}
