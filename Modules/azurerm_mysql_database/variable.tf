variable "mysql_db" {
  description = "A map of MySQL database configurations"
  type = map(object({
    mysql_db_name      = string
    mysql_db_server_id = string
  }))
}