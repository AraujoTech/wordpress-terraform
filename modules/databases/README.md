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
| [helm_release.mysql](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.postgresql](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.databases](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_databases"></a> [enable\_databases](#input\_enable\_databases) | n/a | <pre>object({<br>        postgres = bool<br>        mysql = bool<br>        redis = bool<br>    })</pre> | <pre>{<br>  "mysql": true,<br>  "postgres": false,<br>  "redis": true<br>}</pre> | no |
| <a name="input_mysql"></a> [mysql](#input\_mysql) | **mysql\_version:**Versão do mysql <br><br> **image:** Imagem docker usada para o deployment do mysql <br><br> **port:** Porta usada para acesso ao mysql | <pre>object({<br>        mysql_version = string<br>        image = string<br>        port = number<br>    })</pre> | <pre>{<br>  "image": "mysql",<br>  "mysql_version": "8.2",<br>  "port": 3306<br>}</pre> | no |
| <a name="input_mysql_credentials"></a> [mysql\_credentials](#input\_mysql\_credentials) | **user:** User usado para acessar ao banco de dados. <br><br> **root\_password:** Password do super usuário do MySQL <br><br> **password:** Password usado para acessar ao banco de dados. Se deixarmos em branco será gerada pelo helm na primeira execução. <br><br> **secret\_name:** Nome da secret que armazenará as informações do banco de dados | <pre>object({<br>        user = string<br>        password = string<br>        root_password = string<br>        secret_name = string<br>    })</pre> | <pre>{<br>  "password": "",<br>  "root_password": "",<br>  "secret_name": "mysql-keys",<br>  "user": "wordpress"<br>}</pre> | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | nome do namespace que deverá ser usado pelos databases | `string` | `"databases"` | no |
| <a name="input_postgres"></a> [postgres](#input\_postgres) | **postgres\_version:**Versão do postgres, deve-se utilizar uma versão compatível com PG4WP. Para mais informações consulte https://github.com/PostgreSQL-For-Wordpress/postgresql-for-wordpress <br><br> **image:** Imagem docker usada para o deployment do postgres <br><br> **port:** Porta usada para acesso ao postgres | <pre>object({<br>        postgres_version = string<br>        image = string<br>        port = number<br>    })</pre> | <pre>{<br>  "image": "postgres",<br>  "port": 5432,<br>  "postgres_version": "14.2"<br>}</pre> | no |
| <a name="input_postgres_credentials"></a> [postgres\_credentials](#input\_postgres\_credentials) | **user:** User usado para acessar ao banco de dados. <br><br> **password:** Password usado para acessar ao banco de dados. Se deixarmos ela em branco será gerada pelo helm na primeira execução. <br><br> **secret\_name:** Nome da secret que armazenará as informações do banco de dados | <pre>object({<br>        user = string<br>        password = string<br>        secret_name = string<br>    })</pre> | <pre>{<br>  "password": "",<br>  "secret_name": "postgres-keys",<br>  "user": "wordpress"<br>}</pre> | no |
#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_databases_namespace"></a> [databases\_namespace](#output\_databases\_namespace) | n/a |
| <a name="output_mysql_service"></a> [mysql\_service](#output\_mysql\_service) | n/a |
| <a name="output_postgres_service"></a> [postgres\_service](#output\_postgres\_service) | n/a |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->