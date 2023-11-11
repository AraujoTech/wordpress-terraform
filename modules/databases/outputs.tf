output "databases_namespace" {
  value       =  helm_release.postgresql.metadata[0].namespace
}

output "postgres_service" {
  value       =  "${helm_release.postgresql.metadata[0].name}-svc"
}
