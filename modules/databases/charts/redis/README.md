# k8s

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

Chart Auxiliar para deploy do MySQL

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| image | string | `"mysql"` | Imagem docker usada para o deployment do mysql |
| mysqlSecret | string | `"mysql-keys"` | Nome da secret que armazenará as informações do banco de dados |
| mysqlVersion | float | `14.2` | Versão do mysql, deve-se utilizar uma versão compatível com PG4WP. Para mais informações consulte https://github.com/mysqlQL-For-Wordpress/mysqlql-for-wordpress  |
| password | string | `"gerado automaticamente"` | Password usado para acessar ao banco de dados |
| port | int | `3306` | Porta usada para acesso ao mysql |
| rootPassword | string | `"gerado automaticamente"` | Password do super usuário do MySQL |
| user | string | `"wordpress"` | User usado para acessar ao banco de dados.  |

