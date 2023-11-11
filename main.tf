resource "helm_release" "kubernetes_replicator" {
  name       = "kubernetes-replicator"
  repository = "https://helm.mittwald.de"
  chart      = "kubernetes-replicator"
  namespace  = "kubernetes-replicator"
  force_update = true
  create_namespace = true
}

module "databases" {
    source = "./modules/databases"
    db_secret_name = var.db_secret_name
    depends_on = [helm_release.kubernetes_replicator]
}

output "postgres_chart_ok" {
  value       = module.databases.postgres_service
}
