variable "postgres_credentials" {
    type = object({
        user = string
        password = string
        secret = string
    })
    default = {
        user = "wordpress"
        password = ""
        secret = "postgres-keys"
    }
    description = "**user:** User usado para acessar ao banco de dados. \n\n **password:** Password usado para acessar ao banco de dados. Se deixarmos ela em branco será gerada pelo helm na primeira execução. \n\n **secret:** Nome da secret que armazenará as informações do banco de dados "
    sensitive = true
}

variable "postgres" {
    type = object({
        tag = string
        image = string
        port = number
        db = string
        cpu_requests= string
        cpu_limits= string
        memory_requests= string
        memory_limits= string
        min_replicas = number 
        max_replicas = number

    })
    default = {
        tag = "14.2"
        image = "postgres"
        port = 5432
        db = "wordpress"
        cpu_requests= "256m"
        cpu_limits= "512m"
        memory_requests= "256Mi" 
        memory_limits= "512Mi"
        min_replicas = 1
        max_replicas = 5
    }
    description = "**tag:** Tag da imagem do postgres, deve-se utilizar uma versão compatível com PG4WP. Para mais informações consulte https://github.com/PostgreSQL-For-Wordpress/postgresql-for-wordpress \n\n **image:** Imagem docker usada para o deployment do postgres \n\n **port:** Porta usada para acesso ao postgres \n\n **db:** Nome do banco de dados a ser criado \n\n **cpu_requests:** Especifica a quantidade mínima de CPU que cada pod do contêiner deve ter disponível. As unidades de medida para CPU são milicores (m). \n\n **cpu_limits:** Especifica o máximo de CPU que cada pod do contêiner pode consumir. \n\n **memory_requests:** Especifica a quantidade mínima de memória que cada pod do contêiner deve ter disponível. As unidades de medida para memória são bytes (B), kibibytes (Ki), mebibytes (Mi), etc. \n\n **memory_limits:** Especifica o máximo de memória que cada pod do contêiner pode consumir. \n\n **min_replicas:** Minimo de réplicas dos pods \n\n **max_replicas:** Máximo de réplicas dos pods"
}

variable "redis" {
    type = object({
        tag = string
        image = string
        port = number
        db = number
        cpu_requests= string
        cpu_limits= string
        memory_requests= string
        memory_limits= string
        min_replicas = number 
        max_replicas = number

    })
    default = {
        tag = "6.2-alpine"
        image = "redis"
        port = 6379
        db = 1
        cpu_requests= "256m"
        cpu_limits= "512m"
        memory_requests= "256Mi" 
        memory_limits= "512Mi"
        min_replicas = 1
        max_replicas = 5
    }
    description = "**tag:** Tag da imagem do redis \n\n **image:** Imagem docker usada para o deployment do redis \n\n **port:** Porta usada para acesso ao redis \n\n **db:**# -- Banco de Dados usado pelo cache: 0-15 \n\n **cpu_requests:** Especifica a quantidade mínima de CPU que cada pod do contêiner deve ter disponível. As unidades de medida para CPU são milicores (m). \n\n **cpu_limits:** Especifica o máximo de CPU que cada pod do contêiner pode consumir. \n\n **memory_requests:** Especifica a quantidade mínima de memória que cada pod do contêiner deve ter disponível. As unidades de medida para memória são bytes (B), kibibytes (Ki), mebibytes (Mi), etc. \n\n **memory_limits:** Especifica o máximo de memória que cada pod do contêiner pode consumir. \n\n **min_replicas:** Minimo de réplicas dos pods \n\n **max_replicas:** Máximo de réplicas dos pods"
}



variable "wordpress" {
    type = object({
        tag = string
        image = string
        port = number 
        cpu_requests= string
        cpu_limits= string
        memory_requests= string
        memory_limits= string
        min_replicas = number 
        max_replicas = number
    })
    default = {
        tag = "6.3-php8.2-apache-redis"
        image = "rafaelmendonca29/wordpress-postgres"
        port = 80
        cpu_requests= "256m"
        cpu_limits= "512m"
        memory_requests= "256Mi" 
        memory_limits= "512Mi"
        min_replicas = 1
        max_replicas = 5
    }
    description = "**tag:** Tag da imagem da imagem do wordpress utilizada \n\n **image**: Imagem docker usada para o deployment do wordpress  \n\n **port:** Porta usada para acesso ao wordpress \n\n **cpu_requests:** Especifica a quantidade mínima de CPU que cada pod do contêiner deve ter disponível. As unidades de medida para CPU são milicores (m). \n\n **cpu_limits:** Especifica o máximo de CPU que cada pod do contêiner pode consumir. \n\n **memory_requests:** Especifica a quantidade mínima de memória que cada pod do contêiner deve ter disponível. As unidades de medida para memória são bytes (B), kibibytes (Ki), mebibytes (Mi), etc. \n\n **memory_limits:** Especifica o máximo de memória que cada pod do contêiner pode consumir. \n\n **min_replicas:** Minimo de réplicas dos pods \n\n **max_replicas:** Máximo de réplicas dos pods"
} 


variable "db_namespace"{
    type = string
    default = "databases"
    description = "nome do namespace que deverá ser usado pelos databases"
}
