# k8s

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

Chart Auxiliar para deploy do Postgres

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| hpa | object | `{"max_replicas":5,"min_replicas":1}` | O Horizontal Pod Autoscaler (HPA) é um recurso no Kubernetes que ajusta automaticamente o número de réplicas de um Deployment, ReplicaSet ou StatefulSet com base na utilização de recursos ou métricas personalizadas, garantindo uma escalabilidade dinâmica para atender às demandas variáveis. |
| hpa.max_replicas | int | `5` | Máximo de réplicas dos pods |
| hpa.min_replicas | int | `1` | Minimo de réplicas dos pods |
| postgres.db | string | `"wordpress"` | Nome do banco de dados a ser criado |
| postgres.image | string | `"postgres"` | Imagem docker usada para o deployment do postgres |
| postgres.port | int | `5432` | Porta usada para acesso ao postgres |
| postgres.tag | float | `14.2` | Tag da imagem do postgres, se quiser usar com o wordpress deve-se utilizar uma versão compatível com PG4WP, no entanto **não é recomendável**, pois o Wordpress foi desenvolvido para trabalhar com MySQL. É possível usar o PG4WP, mas o mesmo não funciona corretamente no wordpress rodando em docker. Para mais informações consulte https://github.com/PostgreSQL-For-Wordpress/postgresql-for-wordpress  |
| resources.limits.cpu | string | `"512m"` | Especifica o máximo de CPU que cada pod do contêiner pode consumir. |
| resources.limits.memory | string | `"512Mi"` | Especifica o máximo de memória que cada pod do contêiner pode consumir. |
| resources.requests.cpu | string | `"256m"` | Especifica a quantidade mínima de CPU que cada pod do contêiner deve ter disponível. As unidades de medida para CPU são milicores (m). |
| resources.requests.memory | string | `"256Mi"` | Especifica a quantidade mínima de memória que cada pod do contêiner deve ter disponível. As unidades de medida para memória são bytes (B), kibibytes (Ki), mebibytes (Mi), etc. |
| secrets.password | string | `"gerada automaticamente"` | Password usado para acessar ao banco de dados.  |
| secrets.secret | string | `"postgres-keys"` | Nome da secret que armazenará as informações do banco de dados |
| secrets.user | string | `"wordpress"` | User usado para acessar ao banco de dados.  |

