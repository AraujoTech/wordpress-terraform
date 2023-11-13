variable "namespace"{
    type = string
    default = "wordpress"
    description = "nome do namespace que deverá ser usado pelo wordpress"
}


variable "database" {
    type = object({
      secret_name = string
      host = string
    })
    default ={
      secret_name = "mysql-keys"
      host = ""  
    } 
    description = " **secret_name**: nome da secret que armazena as credenciais do banco de dados \n\n **host:** host de conexão com banco de dados, formado pelo nome do serviço do banco de dados + o namespace "
    sensitive = true
}

variable "wordpress" {
    type = object({
        wordpress_version = string
        image = string
        port = number
        plugins = string
    })
    default = {
        wordpress_version = "latest"
        image = "bitnami/wordpress"
        port = 80
        plugins = ""
    }
    description = "**wordpress_version:** Versão da imagem do wordpress utilizada \n\n **image**: Imagem docker usada para o deployment do wordpress  \n\n **port:** Porta usada para acesso ao wordpress"
}
