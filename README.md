## Introduction
# Projeto WordPress no Minikube com Terraform e Helm

Seja bem-vindo a este repositório, criado para simplificar a implementação de um ambiente WordPress em um cluster Minikube, utilizando Terraform para o provisionamento de infraestrutura e Helm para a administração flexível de aplicativos Kubernetes. Optei pelo Helm não apenas para facilitar a orquestração inicial, mas também com a visão estratégica de possíveis melhorias futuras, como a integração com ferramentas como ArgoCD. Escolhi delegar ao Helm o gerenciamento específico de aplicativos, pois essa abordagem me proporciona uma adaptação mais ágil e eficiente, especialmente quando se trata de atualizações e modificações contínuas na aplicação.

## Visão Geral

Este repositório contém arquivos de configuração do Terraform para definir a infraestrutura necessária, juntamente com os gráficos Helm para implantar e configurar o WordPress e o banco de dados PostgreSQL. O uso do PG4WP como adaptador do WordPress para o PostgreSQL traz uma alternativa robusta e escalável ao banco de dados padrão.

## Pré-requisitos

Antes de começar, certifique-se de ter o Minikube, o Terraform e o Helm instalados em seu ambiente de desenvolvimento. Consulte a seção de [pré-requisitos](#) em nossa documentação para obter instruções detalhadas.

## Como Começar

1. Clone este repositório em sua máquina local:

    ```bash
    git clone https://github.com/AraujoTech/wordpress-terraform.git
    ```

2. Navegue até o diretório do projeto:

    ```bash
    cd wordpress-terraform
    ```

3. Inicialize o terraform:
   
    ```bash
    terraform init
    ```


## Documentação Detalhada

Para obter informações mais detalhadas sobre o processo de configuração, consulte a [documentação completa](docs/README.md). Lá, você encontrará guias passo a passo, explicando cada etapa do processo, desde a instalação até a execução do WordPress no Minikube.

<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
#### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.0.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.11.0 |
#### Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.11.0 |
#### Resources

| Name | Type |
|------|------|
| [helm_release.kubernetes_replicator](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_namespace"></a> [db\_namespace](#input\_db\_namespace) | nome do namespace que deverá ser usado pelos databases | `string` | `"databases"` | no |
| <a name="input_postgres"></a> [postgres](#input\_postgres) | **tag:**Tag da imagem do postgres, deve-se utilizar uma versão compatível com PG4WP. Para mais informações consulte https://github.com/PostgreSQL-For-Wordpress/postgresql-for-wordpress <br><br> **image:** Imagem docker usada para o deployment do postgres <br><br> **port:** Porta usada para acesso ao postgres <br><br> **db:** Nome do banco de dados a ser criado | <pre>object({<br>        tag = string<br>        image = string<br>        port = number<br>        db = string<br>    })</pre> | <pre>{<br>  "db": "wordpress",<br>  "image": "postgres",<br>  "port": 5432,<br>  "tag": "14.2"<br>}</pre> | no |
| <a name="input_postgres_credentials"></a> [postgres\_credentials](#input\_postgres\_credentials) | **user:** User usado para acessar ao banco de dados. <br><br> **password:** Password usado para acessar ao banco de dados. Se deixarmos ela em branco será gerada pelo helm na primeira execução. <br><br> **secret:** Nome da secret que armazenará as informações do banco de dados | <pre>object({<br>        user = string<br>        password = string<br>        secret = string<br>    })</pre> | <pre>{<br>  "password": "",<br>  "secret": "postgres-keys",<br>  "user": "wordpress"<br>}</pre> | no |
| <a name="input_redis"></a> [redis](#input\_redis) | **tag:**Tag da imagem do redis <br><br> **image:** Imagem docker usada para o deployment do redis <br><br> **port:** Porta usada para acesso ao redis <br><br> **db:**# -- Banco de Dados usado pelo cache: 0-15 | <pre>object({<br>        tag = string<br>        image = string<br>        port = number<br>        db = number<br>    })</pre> | <pre>{<br>  "db": 1,<br>  "image": "redis",<br>  "port": 6379,<br>  "tag": "6.2-alpine"<br>}</pre> | no |
| <a name="input_wordpress"></a> [wordpress](#input\_wordpress) | **tag:** Tag da imagem da imagem do wordpress utilizada <br><br> **image**: Imagem docker usada para o deployment do wordpress<br><br> **port:** Porta usada para acesso ao wordpress | <pre>object({<br>        tag = string<br>        image = string<br>        port = number <br>    })</pre> | <pre>{<br>  "image": "rafaelmendonca29/wordpress-postgres",<br>  "port": 80,<br>  "tag": "6.3-php8.2-apache-redis"<br>}</pre> | no |
#### Outputs

No outputs.
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->