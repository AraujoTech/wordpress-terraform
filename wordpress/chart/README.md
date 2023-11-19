# k8s

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

Chart Auxiliar para deploy do Wordpress

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| postgres.db | string | `"wordpress"` | Nome do Banco de dados |
| postgres.host | string | `nil` | Host para conexão com o banco de dados |
| postgres.port | int | `5432` | Porta usada para acesso ao postgres |
| postgres.secret | string | `"postgres-keys"` | Nome da secret que armazenará as informações do banco de dados |
| redis.db | int | `1` | Banco de Dados usado pelo cache: 0-15 |
| redis.host | string | `nil` | Host para conexão com o banco de dados |
| redis.port | int | `6379` | Porta usada para acesso ao mysql |
| wordpress.image | string | `"rafaelmendonca29/wordpress-postgres"` | Imagem docker usada para o deployment do wordpress. Para este projeto foi desenvolvida uma imagem personalizada do wordpress com PG4WP configurado e as configurações necessárias para o uso do Redis. Para mais informações consulte  https://github.com/AraujoTech/wordpress-postgres |
| wordpress.port | int | `80` | Porta usada para acesso ao wordpress |
| wordpress.tag | string | `"6.3-php8.2-apache-redis"` | Tag da imagem da imagem do wordpress utilizada, a mesma deve conter o PG4WP. Para mais informações consulte https://github.com/PostgreSQL-For-Wordpress/postgresql-for-wordpress  |

