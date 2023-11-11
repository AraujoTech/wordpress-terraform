resource "helm_release" "postgresql" {
  name       = "postgresql"
  chart      = "${path.module}/charts/postgresql"
  namespace  = "databases"
  force_update = true
  set_sensitive {
    name="user"
    value= var.postgres.user
   }
  set_sensitive {
    name="password"
    value= var.postgres.password
  }
}
