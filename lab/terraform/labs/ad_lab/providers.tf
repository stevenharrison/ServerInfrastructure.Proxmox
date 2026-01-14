terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      # version = ">= 0.70.0"  # optional pin
    }
  }
}

provider "proxmox" {
  endpoint = "https://192.168.178.117:8006"
  insecure = true

  # for API token auth:
  api_token = var.pm_api_token
}