resource "helm_release" "kubernetes_replicator" {
  name       = "kubernetes-replicator"
  repository = "https://helm.mittwald.de"
  chart      = "kubernetes-replicator"
  namespace  = "kubernetes-replicator"
  force_update = true
  create_namespace = true
  description = "Responsável por replicar as secrets entre os namespaces. Para mais informações consulte https://github.com/mittwald/kubernetes-replicator#using-helm"
}

module "databases" {
    source = "./modules/databases"    
    namespace = var.database_namespace
    enable_databases = {
      postgres = false
      mysql = true
      redis = true
    }

    mysql_credentials = {
      user = var.mysql_credentials.user
      password = var.mysql_credentials. password
      root_password = var.mysql_credentials.root_password
      secret_name = var.mysql_credentials.secret_name
    }
    depends_on = [helm_release.kubernetes_replicator]
}

module "wordpress" {
    source = "./modules/wordpress"
    database = {
      secret_name = var.mysql_credentials.secret_name
      host = "${module.databases.mysql_service}.${module.databases.databases_namespace}"
    }
    depends_on = [helm_release.kubernetes_replicator, module.databases]
}
