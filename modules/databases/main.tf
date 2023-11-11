resource "helm_release" "postgresql" {
  name       = "postgresql"
  chart      = "${path.module}/charts/postgresql"
  namespace  = "${var.namespace}"
  force_update = true
  create_namespace = true
  set_sensitive {
    name="user"
    value= var.postgres.user
   }
  set_sensitive {
    name="password"
    value= var.postgres.password
  }

  set {
    name="postgres-version"
    value= var.postgres.postgres_version
  }
  set {
    name="image"
    value= var.postgres.image
  }

  set {
    name="port"
    value= var.postgres.port
  }

    set {
    name="dbsecret"
    value= var.db_secret_name
  }

}
