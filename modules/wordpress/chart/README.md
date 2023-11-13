# k8s

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

Chart Auxiliar para deploy do Postgres

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| databaseHost | string | `nil` | Host para conexão com o banco de dados |
| databaseSecret | string | `"mysql-keys"` | Nome da secret que armazenará as informações do banco de dados |
| image | string | `"bitnami/wordpress"` | Imagem docker usada para o deployment do wordpress |
| plugins | string | `"wpackagist-plugin/redis-cache"` |  |
| port | int | `80` | Porta usada para acesso ao wordpress |
| wordpressVersion | string | `"latest"` | Versão da imagem do wordpress utilizada, a mesma deve conter o PG4WP. Para mais informações consulte https://github.com/PostgreSQL-For-Wordpress/postgresql-for-wordpress  |

