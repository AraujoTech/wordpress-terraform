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
    source = "./databases"    
    namespace = var.db_namespace

    postgres_credentials = {
      user = var.postgres_credentials.user
      password = var.postgres_credentials.password
      secret = var.postgres_credentials.secret
    }

    postgres = {
        tag = var.postgres.tag
        image = var.postgres.image
        port = var.postgres.port
        db= var.postgres.db
    }

    redis = {
        tag = var.redis.tag
        image = var.redis.image
        port = var.redis.port
        db= var.redis.db
    }
    depends_on = [helm_release.kubernetes_replicator]
}

module "wordpress" {
    source = "./wordpress"
    postgres = {
      secret = var.postgres_credentials.secret
      host = "${module.databases.postgres_service}.${module.databases.databases_namespace}"
      db = var.postgres.db
      port = var.postgres.port
    }

    wordpress={
      tag = var.wordpress.tag
      image = var.wordpress.image
      port = var.wordpress.port
    }

    redis = {
        port = var.redis.port
        host = "${module.databases.redis_service}.${module.databases.databases_namespace}"
        db = var.redis.db
    }
    depends_on = [helm_release.kubernetes_replicator, module.databases]
}
