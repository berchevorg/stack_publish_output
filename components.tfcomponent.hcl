required_providers {
  random = {
    source  = "hashicorp/random"
    version = "~> 3.7.2"
  }
}


variable "length" {
  type = string
}

variable "separator" {
  type = string
}

provider "random" "this" {}

component "pet" {
  source = "./pet"

  inputs = {
    length    = var.length
    separator = var.separator
  }

  providers = {
    random = provider.random.this
  }
}
