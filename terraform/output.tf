output "vpc_id" {
  description = "The VPC ID"
  value       = module.vpc.vpc_id
}

output "ecs_cluster_id" {
  description = "The ECS cluster ID"
  value       = module.ecs_cluster.cluster_id
}

output "react_service_ip" {
  description = "The private IP of the React service"
  value       = module.ecs_service_react.private_ip
}

output "strapi_service_ip" {
  description = "The private IP of the Strapi service"
  value       = module.ecs_service_strapi.private_ip
}
