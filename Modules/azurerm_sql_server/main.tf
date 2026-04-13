resource "azurerm_mssql_server" "mysqlserver" {
    for_each = var.mysql_server
  name                         = each.value.mysql_server_name
  resource_group_name          = each.value.mysql_server_rg
  location                     = each.value.mysql_server_location
  version                      = each.value.mysql_server_version
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
}