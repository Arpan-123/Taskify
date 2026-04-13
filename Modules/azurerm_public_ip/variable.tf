variable "public_ip" {
    description = "Public IP details"
    type = map(object({
        public_ip_name     = string
        public_ip_location = string
        public_ip_rg       = string
    }))
}