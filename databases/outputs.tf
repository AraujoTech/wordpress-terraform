output "databases_namespace" {
  value       = try(kubernetes_namespace.databases.metadata[0].name,"")
  description = "Namespace dos bancos de dados"
}

output "postgres_service" {
  value       =  try("${helm_release.postgresql.metadata[0].name}-svc","")
  description = "Nome do serviço postgres"
}

output "redis_service" {
  value       =  try("${helm_release.redis.metadata[0].name}-svc","")
    description = "Nome do serviço redis"
}
