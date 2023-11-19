<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
#### Requirements

No requirements.
#### Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
#### Resources

| Name | Type |
|------|------|
| [helm_release.wordpress](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_namespace"></a> [namespace](#input\_namespace) | nome do namespace que deverá ser usado pelo wordpress | `string` | `"wordpress"` | no |
| <a name="input_postgres"></a> [postgres](#input\_postgres) | **secret**: nome da secret que armazena as credenciais do banco de dados <br><br> **host:** host de conexão com banco de dados, formado pelo nome do serviço do banco de dados + o namespace <br><br> **db:** Nome do Banco de dados <br><br> **port:** Porta de acesso ao postgres | <pre>object({<br>      secret = string<br>      host = string<br>      db= string<br>      port = number<br>    })</pre> | <pre>{<br>  "db": "",<br>  "host": "",<br>  "port": 5432,<br>  "secret": "postgres-keys"<br>}</pre> | no |
| <a name="input_redis"></a> [redis](#input\_redis) | **port:** Porta usada para acesso ao redis <br><br> **db:**# -- Banco de Dados usado pelo cache: 0-15 | <pre>object({<br>        host = string<br>        port = number<br>        db = number<br>    })</pre> | <pre>{<br>  "db": 1,<br>  "host": "redis",<br>  "port": 6379<br>}</pre> | no |
| <a name="input_wordpress"></a> [wordpress](#input\_wordpress) | **tag:** Tag da imagem da imagem do wordpress utilizada <br><br> **image**: Imagem docker usada para o deployment do wordpress<br><br> **port:** Porta usada para acesso ao wordpress | <pre>object({<br>        tag = string<br>        image = string<br>        port = number <br>    })</pre> | <pre>{<br>  "image": "rafaelmendonca29/wordpress-postgres",<br>  "port": 80,<br>  "tag": "6.3-php8.2-apache-redis"<br>}</pre> | no |
#### Outputs

No outputs.
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->