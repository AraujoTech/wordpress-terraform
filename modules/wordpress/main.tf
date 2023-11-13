resource "helm_release" "wordpress" {
  name       = "wordpress"
  chart      = "${path.module}/chart"
  namespace  = "wordpress"
  force_update = true
  create_namespace = true
  
  set {
    name="image"
    value= var.wordpress.image
  }

    set {
    name="wordpressVersion"
    value= var.wordpress.wordpress_version
  }

   set {
    name="port"
    value= var.wordpress.port
  }

  set {
    name="databaseHost"
    value= var.database.host
  }
  set {
    name="databaseSecret"
    value= var.database.secret_name
  }
  set {
    name="plugins"
    value= var.wordpress.plugins
  }
}