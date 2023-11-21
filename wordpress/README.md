<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
#### Resources

| Name | Type |
|------|------|
| [helm_release.wordpress](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_namespace"></a> [namespace](#input\_namespace) | nome do namespace que deverá ser usado pelo wordpress | `string` | `"wordpress"` | no |
| <a name="input_postgres"></a> [postgres](#input\_postgres) | **secret**: nome da secret que armazena as credenciais do banco de dados <br><br> **host:** host de conexão com banco de dados, formado pelo nome do serviço do banco de dados + o namespace <br><br> **db:** Nome do Banco de dados <br><br> **port:** Porta de acesso ao postgres | <pre>object({<br>      secret = string<br>      host = string<br>      db= string<br>      port = number<br>    })</pre> | <pre>{<br>  "db": "",<br>  "host": "",<br>  "port": 5432,<br>  "secret": "postgres-keys"<br>}</pre> | no |
| <a name="input_redis"></a> [redis](#input\_redis) | **port:** Porta usada para acesso ao redis <br><br> **db:** Banco de Dados usado pelo cache: 0-15 | <pre>object({<br>        host = string<br>        port = number<br>        db = number<br>    })</pre> | <pre>{<br>  "db": 1,<br>  "host": "redis",<br>  "port": 6379<br>}</pre> | no |
| <a name="input_wordpress"></a> [wordpress](#input\_wordpress) | **tag:** Tag da imagem da imagem do wordpress utilizada <br><br> **image**: Imagem docker usada para o deployment do wordpress<br><br> **port:** Porta usada para acesso ao wordpress <br><br> **cpu\_requests:** Especifica a quantidade mínima de CPU que cada pod do contêiner deve ter disponível. As unidades de medida para CPU são milicores (m). <br><br> **cpu\_limits:** Especifica o máximo de CPU que cada pod do contêiner pode consumir. <br><br> **memory\_requests:** Especifica a quantidade mínima de memória que cada pod do contêiner deve ter disponível. As unidades de medida para memória são bytes (B), kibibytes (Ki), mebibytes (Mi), etc. <br><br> **memory\_limits:** Especifica o máximo de memória que cada pod do contêiner pode consumir. <br><br> **min\_replicas:** Minimo de réplicas dos pods <br><br> **max\_replicas:** Máximo de réplicas dos pods | <pre>object({<br>        tag = string<br>        image = string<br>        port = number <br>        cpu_requests= string<br>        cpu_limits= string<br>        memory_requests= string<br>        memory_limits= string<br>        min_replicas = number <br>        max_replicas = number<br>    })</pre> | <pre>{<br>  "cpu_limits": "512m",<br>  "cpu_requests": "256m",<br>  "image": "rafaelmendonca29/wordpress-postgres",<br>  "max_replicas": 5,<br>  "memory_limits": "512Mi",<br>  "memory_requests": "256Mi",<br>  "min_replicas": 1,<br>  "port": 80,<br>  "tag": "6.3-php8.2-apache-redis"<br>}</pre> | no |
#### Outputs

No outputs.
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->