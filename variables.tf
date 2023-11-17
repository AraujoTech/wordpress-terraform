
variable "database_namespace"{
    type = string
    default = "databases"
    description = "nome do namespace que deverá ser usado pelos databases"
}

variable "postgres_credentials" {
    type = object({
        user = string
        password = string
        secret_name = string
    })
    default = {
        user = "wordpress"
        password = ""
        secret_name = "postgres-keys"
    }
    description = "**user:** User usado para acessar ao banco de dados. \n\n **password:** Password usado para acessar ao banco de dados. Se deixarmos ela em branco será gerada pelo helm na primeira execução. \n\n **secret_name:** Nome da secret que armazenará as informações do banco de dados "
    sensitive = true
}

variable "postgres" {
    type = object({
        tag = string
        image = string
        port = number
        name = string
    })
    default = {
        tag = "14.2"
        image = "postgres"
        port = 5432
        name = "wordpress"
    }
    description = "**tag:** Tag da imagem do postgres, deve-se utilizar uma versão compatível com PG4WP. Para mais informações consulte https://github.com/PostgreSQL-For-Wordpress/postgresql-for-wordpress \n\n **image:** Imagem docker usada para o deployment do postgres \n\n **port:** Porta usada para acesso ao postgres "
}

variable "redis" {
    type = object({
        tag = string
        image = string
        port = number
        host = string
        database = number
    })
    default = {
        tag = "6.2-alpine"
        image = "redis"
        port = 6379
        host = ""
        database = 1
    }
    description = "**tag:**Tag da imagem do redis. \n\n **image:** Imagem docker usada para o deployment do redis \n\n **port:** Porta usada para acesso ao redis \n\n **host:** Host do Redis \n\n **database:** Database do Redis de 0 a 15"
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
