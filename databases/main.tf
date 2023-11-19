resource "kubernetes_namespace" "databases" {
  metadata {
    name = "${var.namespace}"
  }
}
resource "helm_release" "postgresql" {
  name       = "postgresql"
  chart      = "${path.module}/charts/postgresql"
  namespace  = "${var.namespace}"
  force_update = true
  set_sensitive {
    name="secrets.user"
    value= var.postgres_credentials.user
   }
  set_sensitive {
    name="secrets.password"
    value= var.postgres_credentials.password
  }
  set_sensitive {
    name="secrets.secret"
    value= var.postgres_credentials.secret
  }

  set {
    name="postgres.tag"
    value= var.postgres.tag
  }
  set {
    name="postgres.image"
    value= var.postgres.image
  }

  set {
    name="postgres.port"
    value= var.postgres.port
  }

  set {
    name="postgres.db"
    value= var.postgres.db
  }
}

resource "helm_release" "redis" {
 
  name       = "redis"
  chart      = "${path.module}/charts/redis"
  namespace  = "${var.namespace}"
  force_update = true
  set {
    name="tag"
    value= var.redis.tag
  }
  set {
    name="image"
    value= var.redis.image
  }

  set {
    name="port"
    value= var.redis.port
  }

  
  set {
    name="db"
    value= var.redis.db
  }
}
