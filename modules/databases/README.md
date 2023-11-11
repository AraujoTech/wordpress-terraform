<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

No requirements.
## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |

	 # Optional variables
	 postgres  = {
  "image": "postgres",
  "password": "",
  "port": 5432,
  "postgres_version": "14.2",
  "user": ""
}
}
```
## Resources

| Name | Type |
|------|------|
| [helm_release.postgresql](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_postgres"></a> [postgres](#input\_postgres) | variáveis do postgresql | <pre>object({<br>        user = string<br>        password = string<br>        postgres_version = string<br>        image = string<br>        port = number<br>    })</pre> | <pre>{<br>  "image": "postgres",<br>  "password": "",<br>  "port": 5432,<br>  "postgres_version": "14.2",<br>  "user": ""<br>}</pre> | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_postgres_chart"></a> [postgres\_chart](#output\_postgres\_chart) | n/a |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->