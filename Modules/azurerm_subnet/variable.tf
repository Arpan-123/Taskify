variable "subnet" {
  type = map(object({
    subnet_name = string
    subnet_rg = string
    subnet_vnet = string
    subnet_address_prefix = list(string)

  }))
}