resource "helm_release" "kubernetes_replicator" {
  name       = "kubernetes_replicator"
  repository = "https://helm.mittwald.de"
  chart      = "mittwald/kubernetes-replicator"
  namespace  = "kubernetes_replicator"
  force_update = true
  create_namespace = true
}

module "databases" {
    source = "./databases"   
}

