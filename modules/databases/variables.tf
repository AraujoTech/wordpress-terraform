variable "postgres" {
    type = object({
        user = string
        password = string
    })
    default = {
        user = ""
        password = ""
    }
    description = "postgresql credentials"
}