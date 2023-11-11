# k8s

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

Chart Auxiliar para deploy do Postgres

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| image | string | `"postgres"` | Imagem docker usada para o deployment |
| password | string | `"gerado automaticamente"` | Password usado para acessar ao banco de dados |
| port | int | `5432` | Porta usada para acesso ao postgres |
| postgresVersion | float | `14.2` | Versão do postgres, deve-se utilizar uma versão compatível com PG4WP. Para mais informações consulte https://github.com/PostgreSQL-For-Wordpress/postgresql-for-wordpress  |
| user | string | `"wordpress"` | User usado para acessar ao banco de dados.  |

