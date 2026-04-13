data "azurerm_subnet" "subid" {
  for_each = var.nic_vm

  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.vnet_rg
}

data "azurerm_public_ip" "pubid" {
  for_each = var.nic_vm

  name                = each.value.public_ip_name
  resource_group_name = each.value.public_ip_rg
}

data "azurerm_key_vault" "kv" {
  for_each = var.nic_vm

  name                = each.value.keyvault_name
  resource_group_name = each.value.keyvault_rg
}

data "azurerm_key_vault_secret" "username" {
  for_each = var.nic_vm

  name         = "vm-username"
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

data "azurerm_key_vault_secret" "password" {
  for_each = var.nic_vm

  name         = "vm-password"
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}