variable "mysql_server" {
  description = "A map of MySQL server configurations"
  type = map(object({
    mysql_server_name              = string
    mysql_server_rg                = string
    mysql_server_location          = string
    mysql_server_version           = string
    administrator_login            = string
    administrator_login_password   = string
  }))
  
}