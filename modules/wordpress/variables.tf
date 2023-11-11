variable "namespace"{
    type = string
    default = "wordpress"
    description = "nome do namespace que deverá ser usado pelo wordpress"
}

variable "db_secret_name" {
    type = string
    description = "nome da secret que armazena as credenciais do banco de dados"
}