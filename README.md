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
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.0.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.11.0 |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.11.0 |
}
```
## Resources

| Name | Type |
|------|------|
| [helm_release.kubernetes_replicator](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
## Inputs

No inputs.
## Outputs

No outputs.
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->