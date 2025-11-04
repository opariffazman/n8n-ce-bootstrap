terraform {
  required_version = "~> 1.13.0"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.66.0"
    }
  }
}

variable "do_token" {
  type      = string
  sensitive = true
}

provider "digitalocean" {
  token = var.do_token
}
