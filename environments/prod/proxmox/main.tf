module "proxmox_vm" {
  source = "../../../modules/proxmox/vm"

  for_each = { for vm in var.proxmox_vms : vm.name => vm }

  name        = "prod-${terraform.workspace}-${each.value.name}"
  description = try(each.value.description, null)
  tags        = try(each.value.tags, [])
  node_name   = each.value.node_name
  vm_id       = each.value.vm_id

  cpu_cores = try(each.value.cpu_cores, null)
  cpu_type  = try(each.value.cpu_type, null)
  memory    = try(each.value.memory, null)

  disk_datastore_id     = try(each.value.disk_datastore_id, null)
  disk_size             = try(each.value.disk_size, null)
  network_device_bridge = try(each.value.network_device_bridge, null)

  image_content_type = each.value.image_content_type
  image_datastore_id = each.value.image_datastore_id
  image_node_name    = each.value.image_node_name
  image_url          = each.value.image_url
  image_file_name    = each.value.image_file_name

  cloud_init_network_ip4        = each.value.cloud_init_network_ip4
  cloud_init_network_gw4        = each.value.cloud_init_network_gw4
  cloud_init_dns_servers        = try(each.value.cloud_init_dns_servers, "8.8.8.8")
  cloud_init_user_data_filename = try(each.value.cloud_init_user_data_filename, null)
  cloud_init_hostname           = try(each.value.cloud_init_hostname, null)
  cloud_init_timezone           = try(each.value.cloud_init_timezone, "Europe/Amsterdam")
  cloud_init_user_name          = try(each.value.cloud_init_user_name, "ansible")
  cloud_init_user_ssh_pub_key   = try(file(each.value.cloud_init_user_ssh_pub_key), null)

  ansible_name                 = try(each.value.ansible_name, null)
  ansible_host                 = try(each.value.ansible_host, null)
  ansible_groups               = try(each.value.ansible_groups, null)
  ansible_user                 = try(each.value.ansible_user, null)
  ansible_ssh_private_key_file = try(each.value.ansible_ssh_private_key_file, null)
}
