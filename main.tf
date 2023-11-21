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
        cpu_requests= var.postgres.cpu_requests
        cpu_limits= var.postgres.cpu_limits
        memory_requests=  var.postgres.memory_requests
        memory_limits= var.postgres.memory_limits
        min_replicas = var.postgres.min_replicas
        max_replicas = var.postgres.max_replicas
 

    }

    redis = {
        tag = var.redis.tag
        image = var.redis.image
        port = var.redis.port
        db= var.redis.db
        cpu_requests= var.redis.cpu_requests
        cpu_limits= var.redis.cpu_limits
        memory_requests=  var.redis.memory_requests
        memory_limits= var.redis.memory_limits
        min_replicas = var.redis.min_replicas
        max_replicas = var.redis.max_replicas
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
      cpu_requests= var.wordpress.cpu_requests
      cpu_limits= var.wordpress.cpu_limits
      memory_requests=  var.wordpress.memory_requests
      memory_limits= var.wordpress.memory_limits
      min_replicas = var.wordpress.min_replicas
      max_replicas = var.wordpress.max_replicas
 
    }

    redis = {
        port = var.redis.port
        host = "${module.databases.redis_service}.${module.databases.databases_namespace}"
        db = var.redis.db
    }
    depends_on = [helm_release.kubernetes_replicator, module.databases]
}
