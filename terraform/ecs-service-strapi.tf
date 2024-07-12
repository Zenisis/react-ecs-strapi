resource "aws_ecs_service" "strapi" {
  name            = "strapi-service"
  cluster         = var.cluster_id
  task_definition = aws_ecs_task_definition.strapi_task_definition.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"


   capacity_provider_strategy {
    capacity_provider = "FARGATE_SPOT"
    weight            = 1
  }
  network_configuration {
    subnets         = var.private_subnets
    security_groups = [var.security_group_id]
    assign_public_ip = true
  }
}

output "private_ip" {
  value = aws_ecs_service.strapi.network_configuration[0].subnets[0]
}
