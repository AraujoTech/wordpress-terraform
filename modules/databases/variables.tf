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
        postgres_version = string
        image = string
        port = number
    })
    default = {
        postgres_version = "14.2"
        image = "postgres"
        port = 5432
    }
    description = "**postgres_version:**Versão do postgres, deve-se utilizar uma versão compatível com PG4WP. Para mais informações consulte https://github.com/PostgreSQL-For-Wordpress/postgresql-for-wordpress \n\n **image:** Imagem docker usada para o deployment do postgres \n\n **port:** Porta usada para acesso ao postgres "
}

variable "mysql_credentials" {
    type = object({
        user = string
        password = string
        root_password = string
        secret_name = string
    })
    default = {
        user = "wordpress"
        password = ""
        root_password =""
        secret_name = "mysql-keys"
    }
    description = "**user:** User usado para acessar ao banco de dados. \n\n **root_password:** Password do super usuário do MySQL \n\n **password:** Password usado para acessar ao banco de dados. Se deixarmos em branco será gerada pelo helm na primeira execução. \n\n **secret_name:** Nome da secret que armazenará as informações do banco de dados "
    sensitive = true
}

variable "mysql" {
    type = object({
        mysql_version = string
        image = string
        port = number
    })
    default = {
        mysql_version = "8.2"
        image = "mysql"
        port = 3306
    }
    description = "**mysql_version:**Versão do mysql \n\n **image:** Imagem docker usada para o deployment do mysql \n\n **port:** Porta usada para acesso ao mysql"
}

variable "enable_databases"{
    type = object({
        postgres = bool
        mysql = bool
        redis = bool
    })
    default = {
        postgres = false
        mysql = true
        redis = true
    }
}


variable "namespace"{
    type = string
    default = "databases"
    description = "nome do namespace que deverá ser usado pelos databases"
}
