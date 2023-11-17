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
| <a name="input_database_namespace"></a> [database\_namespace](#input\_database\_namespace) | nome do namespace que deverá ser usado pelos databases | `string` | `"databases"` | no |
| <a name="input_enable_databases"></a> [enable\_databases](#input\_enable\_databases) | n/a | <pre>object({<br>        postgres = bool<br>        mysql = bool<br>        redis = bool<br>    })</pre> | <pre>{<br>  "mysql": true,<br>  "postgres": false,<br>  "redis": true<br>}</pre> | no |
| <a name="input_mysql"></a> [mysql](#input\_mysql) | **mysql\_version:**Tag da imagem do mysql <br><br> **image:** Imagem docker usada para o deployment do mysql <br><br> **port:** Porta usada para acesso ao mysql | <pre>object({<br>        mysql_version = string<br>        image = string<br>        port = number<br>    })</pre> | <pre>{<br>  "image": "mysql",<br>  "mysql_version": "8.2",<br>  "port": 3306<br>}</pre> | no |
| <a name="input_mysql_credentials"></a> [mysql\_credentials](#input\_mysql\_credentials) | **user:** User usado para acessar ao banco de dados. <br><br> **root\_password:** Password do super usuário do MySQL <br><br> **password:** Password usado para acessar ao banco de dados. Se deixarmos em branco será gerada pelo helm na primeira execução. <br><br> **secret\_name:** Nome da secret que armazenará as informações do banco de dados | <pre>object({<br>        user = string<br>        password = string<br>        root_password = string<br>        secret_name = string<br>    })</pre> | <pre>{<br>  "password": "",<br>  "root_password": "",<br>  "secret_name": "mysql-keys",<br>  "user": "wordpress"<br>}</pre> | no |
| <a name="input_postgres"></a> [postgres](#input\_postgres) | **postgres\_version:**Tag da imagem do postgres, deve-se utilizar uma versão compatível com PG4WP. Para mais informações consulte https://github.com/PostgreSQL-For-Wordpress/postgresql-for-wordpress <br><br> **image:** Imagem docker usada para o deployment do postgres <br><br> **port:** Porta usada para acesso ao postgres | <pre>object({<br>        tag = string<br>        image = string<br>        port = number<br>    })</pre> | <pre>{<br>  "image": "postgres",<br>  "port": 5432,<br>  "tag": "14.2"<br>}</pre> | no |
| <a name="input_postgres_credentials"></a> [postgres\_credentials](#input\_postgres\_credentials) | **user:** User usado para acessar ao banco de dados. <br><br> **password:** Password usado para acessar ao banco de dados. Se deixarmos ela em branco será gerada pelo helm na primeira execução. <br><br> **secret\_name:** Nome da secret que armazenará as informações do banco de dados | <pre>object({<br>        user = string<br>        password = string<br>        secret_name = string<br>    })</pre> | <pre>{<br>  "password": "",<br>  "secret_name": "postgres-keys",<br>  "user": "wordpress"<br>}</pre> | no |
| <a name="input_wordpress"></a> [wordpress](#input\_wordpress) | **wordpress\_version:** Tag da imagem da imagem do wordpress utilizada <br><br> **image**: Imagem docker usada para o deployment do wordpress<br><br> **port:** Porta usada para acesso ao wordpress <br><br> **database**: Define qual o banco de dados do Wordpress | <pre>object({<br>        tag = string<br>        image = string<br>        port = number<br>        plugins = string<br>    })</pre> | <pre>{<br>  "image": "bitnami/wordpress",<br>  "plugins": "",<br>  "port": 80,<br>  "tag": "latest"<br>}</pre> | no |
#### Outputs

No outputs.
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->