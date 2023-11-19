# k8s

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

Chart Auxiliar para deploy do Redis

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| db | int | `1` | Banco de Dados usado pelo cache: 0-15 |
| image | string | `"redis"` | Imagem docker usada para o deployment do Redis |
| port | int | `6379` | Porta usada para acesso ao mysql |
| tag | string | `"6.2-alpine"` | Tag da imagem do redis |

