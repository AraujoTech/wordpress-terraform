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
    description = "**port:** Porta usada para acesso ao redis \n\n **db:** Banco de Dados usado pelo cache: 0-15"
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
    description = "**tag:** Tag da imagem da imagem do wordpress utilizada \n\n **image**: Imagem docker usada para o deployment do wordpress  \n\n **port:** Porta usada para acesso ao wordpress \n\n **cpu_requests:** Especifica a quantidade mínima de CPU que cada pod do contêiner deve ter disponível. As unidades de medida para CPU são milicores (m). \n\n **cpu_limits:** Especifica o máximo de CPU que cada pod do contêiner pode consumir. \n\n **memory_requests:** Especifica a quantidade mínima de memória que cada pod do contêiner deve ter disponível. As unidades de medida para memória são bytes (B), kibibytes (Ki), mebibytes (Mi), etc. \n\n **memory_limits:** Especifica o máximo de memória que cada pod do contêiner pode consumir. \n\n **min_replicas:** Minimo de réplicas dos pods \n\n **max_replicas:** Máximo de réplicas dos pods \n\n"
} 
