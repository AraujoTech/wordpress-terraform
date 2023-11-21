# k8s

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

Chart Auxiliar para deploy do Redis

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| db | int | `1` | Banco de Dados usado pelo cache: 0-15 |
| hpa | object | `{"max_replicas":5,"min_replicas":1}` | O Horizontal Pod Autoscaler (HPA) é um recurso no Kubernetes que ajusta automaticamente o número de réplicas de um Deployment, ReplicaSet ou StatefulSet com base na utilização de recursos ou métricas personalizadas, garantindo uma escalabilidade dinâmica para atender às demandas variáveis. |
| hpa.max_replicas | int | `5` | Máximo de réplicas dos pods |
| hpa.min_replicas | int | `1` | Minimo de réplicas dos pods |
| image | string | `"redis"` | Imagem docker usada para o deployment do Redis |
| port | int | `6379` | Porta usada para acesso ao mysql |
| resources.limits.cpu | string | `"512m"` | Especifica o máximo de CPU que cada pod do contêiner pode consumir. |
| resources.limits.memory | string | `"512Mi"` | Especifica o máximo de memória que cada pod do contêiner pode consumir. |
| resources.requests.cpu | string | `"256m"` | Especifica a quantidade mínima de CPU que cada pod do contêiner deve ter disponível. As unidades de medida para CPU são milicores (m). |
| resources.requests.memory | string | `"256Mi"` | Especifica a quantidade mínima de memória que cada pod do contêiner deve ter disponível. As unidades de medida para memória são bytes (B), kibibytes (Ki), mebibytes (Mi), etc. |
| tag | string | `"6.2-alpine"` | Tag da imagem do redis |

