variable "pve_api_url" {
  description = "Proxmox VE API URL"
  type        = string
}

variable "pve_api_token" {
  description = "Proxmox API token"
  type        = string
  sensitive   = true
}

variable "proxmox_vms" {
  description = "List of VM configurations."
  type = list(object({
    name        = string
    description = optional(string)
    tags        = optional(list(string), [])
    node_name   = string
    vm_id       = number

    cpu_cores = optional(number, 2)
    cpu_type  = optional(string, "x86-64-v2-AES")
    memory    = optional(number, 4096)

    disk_datastore_id     = optional(string, "local-lvm")
    disk_size             = optional(number, 50)
    network_device_bridge = optional(string, "vmbr0")

    image_content_type = string
    image_datastore_id = string
    image_node_name    = string
    image_url          = string
    image_file_name    = string

    cloud_init_network_ip4        = string
    cloud_init_network_gw4        = string
    cloud_init_dns_servers        = optional(list(string), ["8.8.8.8"])
    cloud_init_user_data_filename = optional(string)
    cloud_init_hostname           = optional(string)
    cloud_init_timezone           = optional(string, "Europe/Amsterdam")
    cloud_init_user_name          = optional(string, "ansible")
    cloud_init_user_ssh_pub_key   = optional(string)

    ansible_name                 = optional(string)
    ansible_host                 = optional(string)
    ansible_groups               = optional(list(string), [])
    ansible_user                 = optional(string, "ansible")
    ansible_ssh_private_key_file = optional(string)
  }))
  default = []
}
