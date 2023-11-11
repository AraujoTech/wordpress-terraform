variable "postgres" {
    type = object({
        user = string
        password = string
        postgres_version = string
        image = string
        port = number
    })
    default = {
        user = ""
        password = ""
        postgres_version = "14.2"
        image = "postgres"
        port = 5432
    }
    description = "variáveis do postgresql"
}

variable "namespace"{
    type = string
    default = "databases"
    description = "nome do namespace que deverá ser usado pelos databases"
}

variable "db_secret_name" {
    type = string
    description = "nome da secret que deverá armazenar as credenciais do banco de dados"
}