required_providers {
  random = {
    source  = "hashicorp/random"
    version = "~> 3.7.2"
  }
}

variable "clusters" {
  description = "Map of Kubernetes clusters"
  type = map(object({
    version = string
    id      = string
  }))

  default = {
      cluster1 = {
        version = "1.33.5"
        id      = "/subscriptions/.../aks1"
      }
      cluster2 = {
        version = "1.32.1"
        id      = "/subscriptions/.../aks2"
      }
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
