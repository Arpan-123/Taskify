resource "azurerm_mssql_database" "mysqldatabase" {
    for_each = var.mysql_db
  name         = each.value.mysql_db_name
  server_id    = each.value.mysql_db_server_id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"
}