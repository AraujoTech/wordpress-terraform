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
| <a name="input_database"></a> [database](#input\_database) | **secret\_name**: nome da secret que armazena as credenciais do banco de dados <br><br> **host:** host de conexão com banco de dados, formado pelo nome do serviço do banco de dados + o namespace | <pre>object({<br>      secret_name = string<br>      host = string<br>    })</pre> | <pre>{<br>  "host": "",<br>  "secret_name": "mysql-keys"<br>}</pre> | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | nome do namespace que deverá ser usado pelo wordpress | `string` | `"wordpress"` | no |
| <a name="input_wordpress"></a> [wordpress](#input\_wordpress) | **wordpress\_version:** Versão da imagem do wordpress utilizada <br><br> **image**: Imagem docker usada para o deployment do wordpress<br><br> **port:** Porta usada para acesso ao wordpress | <pre>object({<br>        wordpress_version = string<br>        image = string<br>        port = number<br>        plugins = string<br>    })</pre> | <pre>{<br>  "image": "bitnami/wordpress",<br>  "plugins": "",<br>  "port": 80,<br>  "wordpress_version": "latest"<br>}</pre> | no |
#### Outputs

No outputs.
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->