postgres_credentials= {
    user = "wordpress"
    password = ""
    secret = "postgres-keys"
    }

postgres = {
        tag = "14.2"
        image = "postgres"
        port = 5432
        db = "wordpress"
        cpu_requests= "256m"
        cpu_limits= "512m"
        memory_requests= "256Mi" 
        memory_limits= "512Mi"
        min_replicas = 1
        max_replicas = 5
        
    }
   
redis = {
        tag = "6.2-alpine"
        image = "redis"
        port = 6379
        db = 1
        cpu_requests= "256m"
        cpu_limits= "512m"
        memory_requests= "256Mi" 
        memory_limits= "512Mi"
        min_replicas = 1
        max_replicas = 5
        

    }

wordpress = {
        tag = "6.3-php8.2-apache-redis"
        image = "rafaelmendonca29/wordpress-postgres"
        port = 80
        cpu_requests= "256m"
        cpu_limits= "512m"
        memory_requests= "256Mi" 
        memory_limits= "512Mi"
        min_replicas = 1
        max_replicas = 5
    }

db_namespace = "databases"