variable "db_secret_name" {
    type = string
    default = "postgres-keys"
    description = "nome da secret que deverá armazenar as credenciais do banco de dados"
}