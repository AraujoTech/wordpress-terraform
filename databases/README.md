<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
#### Requirements

No requirements.
#### Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |
#### Resources

| Name | Type |
|------|------|
| [helm_release.postgresql](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.redis](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.databases](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_namespace"></a> [namespace](#input\_namespace) | nome do namespace que deverá ser usado pelos databases | `string` | `"databases"` | no |
| <a name="input_postgres"></a> [postgres](#input\_postgres) | **tag:** Tag da imagem do postgres, deve-se utilizar uma versão compatível com PG4WP. Para mais informações consulte https://github.com/PostgreSQL-For-Wordpress/postgresql-for-wordpress <br><br> **image:** Imagem docker usada para o deployment do postgres <br><br> **port:** Porta usada para acesso ao postgres <br><br> **db:** Nome do banco de dados a ser criado | <pre>object({<br>        tag = string<br>        image = string<br>        port = number<br>        db = string<br>    })</pre> | <pre>{<br>  "db": "wordpress",<br>  "image": "postgres",<br>  "port": 5432,<br>  "tag": "14.2"<br>}</pre> | no |
| <a name="input_postgres_credentials"></a> [postgres\_credentials](#input\_postgres\_credentials) | **user:** User usado para acessar ao banco de dados. <br><br> **password:** Password usado para acessar ao banco de dados. Se deixarmos ela em branco será gerada pelo helm na primeira execução. <br><br> **secret:** Nome da secret que armazenará as informações do banco de dados | <pre>object({<br>        user = string<br>        password = string<br>        secret = string<br>    })</pre> | <pre>{<br>  "password": "",<br>  "secret": "postgres-keys",<br>  "user": "wordpress"<br>}</pre> | no |
| <a name="input_redis"></a> [redis](#input\_redis) | **tag:** Tag da imagem do redis <br><br> **image:** Imagem docker usada para o deployment do redis <br><br> **port:** Porta usada para acesso ao redis <br><br> **db:**# -- Banco de Dados usado pelo cache: 0-15 | <pre>object({<br>        tag = string<br>        image = string<br>        port = number<br>        db = number<br>    })</pre> | <pre>{<br>  "db": 1,<br>  "image": "redis",<br>  "port": 6379,<br>  "tag": "6.2-alpine"<br>}</pre> | no |
#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_databases_namespace"></a> [databases\_namespace](#output\_databases\_namespace) | n/a |
| <a name="output_postgres_service"></a> [postgres\_service](#output\_postgres\_service) | n/a |
| <a name="output_redis_service"></a> [redis\_service](#output\_redis\_service) | n/a |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->