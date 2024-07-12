resource "aws_ecs_service" "react" {
  name            = "react-service"
  cluster         = var.cluster_id
  task_definition = aws_ecs_task_definition.react_task_definition.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"
  network_configuration {
    subnets         = var.private_subnets
    security_groups = [var.security_group_id]
    assign_public_ip = true
  }
}

output "private_ip" {
  value = aws_ecs_service.react.network_configuration[0].subnets[0]
}
