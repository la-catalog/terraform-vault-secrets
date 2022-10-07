terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 3.8.2"
    }
  }
}

variable "machine_ip" {
  type      = string
  sensitive = true
}

variable "vault_token" {
  type      = string
  sensitive = true
}

provider "vault" {
  address = "http://${var.machine_ip}:8200"
  token   = var.vault_token
}