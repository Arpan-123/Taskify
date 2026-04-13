variable "vnet" {
    description = "Virtual network details"
    type = map(object({
        vnet_name     = string
        vnet_location = string
        vnet_rg       = string
        address_space  = list(string)
        dns_servers    = list(string)
    }))
}