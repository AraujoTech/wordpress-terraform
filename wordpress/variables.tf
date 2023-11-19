variable "namespace"{
    type = string
    default = "wordpress"
    description = "nome do namespace que deverá ser usado pelo wordpress"
}


variable "postgres" {
    type = object({
      secret = string
      host = string
      db= string
      port = number
    })
    default ={
      secret = "postgres-keys"
      host = ""
      db = "" 
      port = 5432

    } 
    description = " **secret**: nome da secret que armazena as credenciais do banco de dados \n\n **host:** host de conexão com banco de dados, formado pelo nome do serviço do banco de dados + o namespace \n\n **db:** Nome do Banco de dados \n\n **port:** Porta de acesso ao postgres "
    sensitive = true
}

variable "redis" {
    type = object({
        host = string
        port = number
        db = number
    })
    default = {
        host = "redis"
        port = 6379
        db = 1
    }
    description = "**port:** Porta usada para acesso ao redis \n\n **db:**# -- Banco de Dados usado pelo cache: 0-15"
}

variable "wordpress" {
    type = object({
        tag = string
        image = string
        port = number 
    })
    default = {
        tag = "6.3-php8.2-apache-redis"
        image = "rafaelmendonca29/wordpress-postgres"
        port = 80
    }
    description = "**tag:** Tag da imagem da imagem do wordpress utilizada \n\n **image**: Imagem docker usada para o deployment do wordpress  \n\n **port:** Porta usada para acesso ao wordpress"
}
