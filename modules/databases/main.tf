resource "kubernetes_namespace" "databases" {
  metadata {
    name = "${var.namespace}"
  }
}
resource "helm_release" "postgresql" {
  count = var.enable_databases.postgres ? 1 : 0
  name       = "postgresql"
  chart      = "${path.module}/charts/postgresql"
  namespace  = "${var.namespace}"
  force_update = true
  set_sensitive {
    name="user"
    value= var.postgres_credentials.user
   }
  set_sensitive {
    name="password"
    value= var.postgres_credentials.password
  }
  set_sensitive {
    name="postgresSecret"
    value= var.postgres_credentials.secret_name
  }

  set {
    name="postgresVersion"
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
}

resource "helm_release" "mysql" {
  count = var.enable_databases.mysql ? 1 : 0
  name       = "mysql"
  chart      = "${path.module}/charts/mysql"
  namespace  = "${var.namespace}"
  force_update = true
  set_sensitive {
    name="user"
    value= var.mysql_credentials.user
   }
  set_sensitive {
    name="password"
    value= var.mysql_credentials.password
  }
    set_sensitive {
    name="rootPassword"
    value= var.mysql_credentials.root_password
  }
  set_sensitive {
    name="mysqlSecret"
    value= var.mysql_credentials.secret_name
  }

  set {
    name="mysqlVersion"
    value= var.mysql.mysql_version
  }
  set {
    name="image"
    value= var.mysql.image
  }

  set {
    name="port"
    value= var.mysql.port
  }
}
