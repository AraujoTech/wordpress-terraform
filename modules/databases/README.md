<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

No requirements.

	 # Optional variables
	 postgres  = {
  "password": "",
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
| <a name="input_postgres"></a> [postgres](#input\_postgres) | postgresql credentials | <pre>object({<br>        user = string<br>        password = string<br>    })</pre> | <pre>{<br>  "password": "",<br>  "user": ""<br>}</pre> | no |
## Outputs

No outputs.
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->