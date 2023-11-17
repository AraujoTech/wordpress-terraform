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

    postgres_credentials = {
      user = var.postgres_credentials.user
      password = var.postgres_credentials. password
      secret_name = var.postgres_credentials.secret_name
    }
    depends_on = [helm_release.kubernetes_replicator]
}

module "wordpress" {
    source = "./modules/wordpress"
    postgres = {
      secret = var.postgres_credentials.secret_name
      host = "${module.databases.postgres_service}.${module.databases.databases_namespace}"
      name = var.postgres.name
      port = var.postgres.port
    }

    wordpress={
      tag = var.wordpress.tag
      image = var.wordpress.image
      port = var.wordpress.port
    }

    redis = {
        tag = var.redis.tag
        image = var.redis.image
        port = var.redis.port
        host = "${module.databases.redis_service}.${module.databases.databases_namespace}"
        database = var.redis.database
    }
    depends_on = [helm_release.kubernetes_replicator, module.databases]
}
