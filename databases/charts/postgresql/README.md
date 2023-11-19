# k8s

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

Chart Auxiliar para deploy do Postgres

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| postgres.db | string | `"wordpress"` | Nome do banco de dados a ser criado |
| postgres.image | string | `"postgres"` | Imagem docker usada para o deployment do postgres |
| postgres.port | int | `5432` | Porta usada para acesso ao postgres |
| postgres.tag | float | `14.2` | Tag da imagem do postgres, se quiser usar com o wordpress deve-se utilizar uma versão compatível com PG4WP, no entanto **não é recomendável**, pois o Wordpress foi desenvolvido para trabalhar com MySQL. É possível usar o PG4WP, mas o mesmo não funciona corretamente no wordpress rodando em docker. Para mais informações consulte https://github.com/PostgreSQL-For-Wordpress/postgresql-for-wordpress  |
| secrets.password | string | `"gerada automaticamente"` | Password usado para acessar ao banco de dados.  |
| secrets.secret | string | `"postgres-keys"` | Nome da secret que armazenará as informações do banco de dados |
| secrets.user | string | `"wordpress"` | User usado para acessar ao banco de dados.  |

