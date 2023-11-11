resource "helm_release" "wordpress" {
  name       = "postgresql"
  chart      = "${path.module}/chart"
  namespace  = "wordpress"
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

 
}
