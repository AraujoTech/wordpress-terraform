output "databases_namespace" {
  value       = kubernetes_namespace.databases.metadata[0].name
}

output "postgres_service" {
  value       =  try("${helm_release.postgresql[0].metadata[0].name}-svc","")
}

output "mysql_service" {
  value       =  "${helm_release.mysql[0].metadata[0].name}-svc"
}
