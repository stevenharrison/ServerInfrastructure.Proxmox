
provider "proxmox" {
  pm_api_url      = "https://192.168.178.117:8006/api2/json"
  pm_user         = "terraform@pve!terraform"
  pm_api_token    = var.pm_api_token
  pm_tls_insecure = true
}