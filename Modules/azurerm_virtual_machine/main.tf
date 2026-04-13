resource "azurerm_network_interface" "nic" {
  for_each = var.nic_vm

  name                = each.value.nic_name
  location            = each.value.nic_location
  resource_group_name = each.value.nic_rg

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = data.azurerm_subnet.subid[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.pubid[each.key].id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.nic_vm

  name                = each.value.vm_name
  resource_group_name = each.value.vm_rg
  location            = each.value.vm_location
  size                = each.value.vm_size

  disable_password_authentication = false

  admin_username = data.azurerm_key_vault_secret.username[each.key].value
  admin_password = data.azurerm_key_vault_secret.password[each.key].value

  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.vm_image_publisher
    offer     = each.value.vm_image_offer
    sku       = each.value.vm_image_sku
    version   = each.value.vm_image_version
  }
}