resource "helm_release" "wordpress" {
  name       = "wordpress"
  chart      = "${path.module}/chart"
  namespace  = "wordpress"
  force_update = true
  create_namespace = true
  
  set {
    name="wordpress.image"
    value= var.wordpress.image
  }

    set {
    name="wordpress.tag"
    value= var.wordpress.tag
  }

   set {
    name="wordpress.port"
    value= var.wordpress.port
  }

  set {
    name="postgres.host"
    value= var.postgres.host
  }
  set {
    name="postgres.secret"
    value= var.postgres.secret
  }
  set {
    name="postgres.db"
    value= var.postgres.db
  }

  set {
    name="redis.db"
    value= var.redis.db
  }

set {
    name="redis.host"
    value= var.redis.host
  }
set {
    name="redis.port"
    value= var.redis.port
  }
}