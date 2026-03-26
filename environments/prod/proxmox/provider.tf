provider "proxmox" {
  endpoint  = var.pve_api_url
  api_token = var.pve_api_token
  insecure  = true
  ssh {
    agent    = true
    username = "terraform"
  }
}
