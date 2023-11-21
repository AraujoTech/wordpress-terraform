# Projeto WordPress no Minikube com Terraform e Helm

Seja bem-vindo a este repositório, criado para simplificar a implementação de um ambiente WordPress em um cluster Minikube, utilizando Terraform para o provisionamento de infraestrutura e Helm para a administração flexível de aplicativos Kubernetes. Optei pelo Helm não apenas para facilitar a orquestração inicial, mas também com a visão estratégica de possíveis melhorias futuras, como a integração com ferramentas como ArgoCD. Escolhi delegar ao Helm o gerenciamento específico de aplicativos, pois essa abordagem me proporciona uma adaptação mais ágil e eficiente, especialmente quando se trata de atualizações e modificações contínuas na aplicação.

## Visão Geral

Este repositório contém arquivos de configuração do Terraform para definir a infraestrutura necessária, juntamente com os gráficos Helm para implantar e configurar o WordPress e o banco de dados PostgreSQL. O uso do PG4WP como adaptador do WordPress para o PostgreSQL traz uma alternativa robusta e escalável ao banco de dados padrão.

## Pré-requisitos

Antes de começar, certifique-se de ter o Minikube, o Terraform e o Helm instalados em seu ambiente de desenvolvimento. Consulte a seção [requirements](#) em nossa documentação para obter instruções detalhadas.

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
4. Rode o terraform plan:
   
    ```bash
    terraform plan
    ```
5. Execute o comando abaixo para garantir que todos os serviços irão subir sem travarem no estado pending:
   ```bash
    minikube tunnel
    ```
6. Dê o apply no terraform para implementar os deployments:
   
    ```bash
    terraform apply
    ```
7. Execute o comando abaixo para acessar o serviço de wordpress pelo seu navegador:
```bash
    minikube service wordpress-svc -n wordpress --url
```
#### Carga no banco de dados
1. Crie uma imagem docker contendo o postgres ou utilize uma já existente.
2. Crie um script na linguagem de sua preferência para conexão com o banco de dados, dentro da pasta scripts você poderá ver um exemplo em python.
3. Configure o script para receber como parametro ou variável de ambiente o host do banco de dados, o nome do usuário, senha e nome do banco de dados.
4. Crie um arquivo yaml para a criação do job seguindo o exemplo abaixo, lembrando que o comando vai depender do seu script: 
```yaml
    apiVersion: batch/v1
    kind: Job
    metadata:
    name: wordpress-data-loader
    spec:
    template:
        spec:
        containers:
        - name: data-loader
            image: your-docker-image:tag
            command: ["python", "load_data.py", "postgresql-svc.databases.svc.cluster.local", "<database_name>", "<username>", "<password>"]
        restartPolicy: Never
    backoffLimit: 4
```
5. Execute para configurar o job
```bash 
        kubectl apply -f ./scripts/jobs.yaml 
```
#### Credenciais
Por padrão a senha do banco de dados é gerada automaticamente no helm chart responsável pela criação do mesmo, apesar de ser totalmente customizável, apenas alterando a variável postgres_credentials no arquivo tfvars de exemplo.

Para pegar o valor da senha gerada automaticamente, execute o comando:
    
```bash 
        kubectl -n databases get secret postgres-keys -o jsonpath="{.data.password}" | base64 -d 
```
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
| <a name="input_postgres"></a> [postgres](#input\_postgres) | **tag:** Tag da imagem do postgres, deve-se utilizar uma versão compatível com PG4WP. Para mais informações consulte https://github.com/PostgreSQL-For-Wordpress/postgresql-for-wordpress <br><br> **image:** Imagem docker usada para o deployment do postgres <br><br> **port:** Porta usada para acesso ao postgres <br><br> **db:** Nome do banco de dados a ser criado <br><br> **cpu\_requests:** Especifica a quantidade mínima de CPU que cada pod do contêiner deve ter disponível. As unidades de medida para CPU são milicores (m). <br><br> **cpu\_limits:** Especifica o máximo de CPU que cada pod do contêiner pode consumir. <br><br> **memory\_requests:** Especifica a quantidade mínima de memória que cada pod do contêiner deve ter disponível. As unidades de medida para memória são bytes (B), kibibytes (Ki), mebibytes (Mi), etc. <br><br> **memory\_limits:** Especifica o máximo de memória que cada pod do contêiner pode consumir. <br><br> **min\_replicas:** Minimo de réplicas dos pods <br><br> **max\_replicas:** Máximo de réplicas dos pods | <pre>object({<br>        tag = string<br>        image = string<br>        port = number<br>        db = string<br>        cpu_requests= string<br>        cpu_limits= string<br>        memory_requests= string<br>        memory_limits= string<br>        min_replicas = number <br>        max_replicas = number<br>    })</pre> | <pre>{<br>  "cpu_limits": "512m",<br>  "cpu_requests": "256m",<br>  "db": "wordpress",<br>  "image": "postgres",<br>  "max_replicas": 5,<br>  "memory_limits": "512Mi",<br>  "memory_requests": "256Mi",<br>  "min_replicas": 1,<br>  "port": 5432,<br>  "tag": "14.2"<br>}</pre> | no |
| <a name="input_postgres_credentials"></a> [postgres\_credentials](#input\_postgres\_credentials) | **user:** User usado para acessar ao banco de dados. <br><br> **password:** Password usado para acessar ao banco de dados. Se deixarmos ela em branco será gerada pelo helm na primeira execução. <br><br> **secret:** Nome da secret que armazenará as informações do banco de dados | <pre>object({<br>        user = string<br>        password = string<br>        secret = string<br>    })</pre> | <pre>{<br>  "password": "",<br>  "secret": "postgres-keys",<br>  "user": "wordpress"<br>}</pre> | no |
| <a name="input_redis"></a> [redis](#input\_redis) | **tag:** Tag da imagem do redis <br><br> **image:** Imagem docker usada para o deployment do redis <br><br> **port:** Porta usada para acesso ao redis <br><br> **db:**# -- Banco de Dados usado pelo cache: 0-15 <br><br> **cpu\_requests:** Especifica a quantidade mínima de CPU que cada pod do contêiner deve ter disponível. As unidades de medida para CPU são milicores (m). <br><br> **cpu\_limits:** Especifica o máximo de CPU que cada pod do contêiner pode consumir. <br><br> **memory\_requests:** Especifica a quantidade mínima de memória que cada pod do contêiner deve ter disponível. As unidades de medida para memória são bytes (B), kibibytes (Ki), mebibytes (Mi), etc. <br><br> **memory\_limits:** Especifica o máximo de memória que cada pod do contêiner pode consumir. <br><br> **min\_replicas:** Minimo de réplicas dos pods <br><br> **max\_replicas:** Máximo de réplicas dos pods | <pre>object({<br>        tag = string<br>        image = string<br>        port = number<br>        db = number<br>        cpu_requests= string<br>        cpu_limits= string<br>        memory_requests= string<br>        memory_limits= string<br>        min_replicas = number <br>        max_replicas = number<br><br>    })</pre> | <pre>{<br>  "cpu_limits": "512m",<br>  "cpu_requests": "256m",<br>  "db": 1,<br>  "image": "redis",<br>  "max_replicas": 5,<br>  "memory_limits": "512Mi",<br>  "memory_requests": "256Mi",<br>  "min_replicas": 1,<br>  "port": 6379,<br>  "tag": "6.2-alpine"<br>}</pre> | no |
| <a name="input_wordpress"></a> [wordpress](#input\_wordpress) | **tag:** Tag da imagem da imagem do wordpress utilizada <br><br> **image**: Imagem docker usada para o deployment do wordpress<br><br> **port:** Porta usada para acesso ao wordpress <br><br> **cpu\_requests:** Especifica a quantidade mínima de CPU que cada pod do contêiner deve ter disponível. As unidades de medida para CPU são milicores (m). <br><br> **cpu\_limits:** Especifica o máximo de CPU que cada pod do contêiner pode consumir. <br><br> **memory\_requests:** Especifica a quantidade mínima de memória que cada pod do contêiner deve ter disponível. As unidades de medida para memória são bytes (B), kibibytes (Ki), mebibytes (Mi), etc. <br><br> **memory\_limits:** Especifica o máximo de memória que cada pod do contêiner pode consumir. <br><br> **min\_replicas:** Minimo de réplicas dos pods <br><br> **max\_replicas:** Máximo de réplicas dos pods | <pre>object({<br>        tag = string<br>        image = string<br>        port = number <br>        cpu_requests= string<br>        cpu_limits= string<br>        memory_requests= string<br>        memory_limits= string<br>        min_replicas = number <br>        max_replicas = number<br>    })</pre> | <pre>{<br>  "cpu_limits": "512m",<br>  "cpu_requests": "256m",<br>  "image": "rafaelmendonca29/wordpress-postgres",<br>  "max_replicas": 5,<br>  "memory_limits": "512Mi",<br>  "memory_requests": "256Mi",<br>  "min_replicas": 1,<br>  "port": 80,<br>  "tag": "6.3-php8.2-apache-redis"<br>}</pre> | no |
#### Outputs

No outputs.
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->

# Mais detalhes
Nas pastas dos módulos e dos charts presentes neste repositório há Readmes especifícos para cada um, consulte-os para mais detalhes.