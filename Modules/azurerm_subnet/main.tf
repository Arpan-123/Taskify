resource "azurerm_subnet" "subnet" {
    for_each = var.subnet
  name                 = each.value.subnet_name
  resource_group_name  = each.value.subnet_rg
  virtual_network_name = each.value.subnet_vnet
  address_prefixes     = each.value.subnet_address_prefix
  } 