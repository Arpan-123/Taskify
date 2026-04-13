variable "nic_vm" {
  type = map(object({
    nic_name     = string
    nic_location = string
    nic_rg       = string

    # Subnet (data source)
    subnet_name = string
    vnet_name   = string
    vnet_rg     = string

    # Public IP (data source)
    public_ip_name = string
    public_ip_rg   = string

    # Key Vault (data source)
    keyvault_name = string
    keyvault_rg   = string

    # VM
    vm_name     = string
    vm_rg       = string
    vm_location = string
    vm_size     = string

    vm_image_publisher = string
    vm_image_offer     = string
    vm_image_sku       = string
    vm_image_version   = string
  }))
}