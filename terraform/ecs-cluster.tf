resource "aws_ecs_cluster" "main" {
  name = "main"
}

output "cluster_id" {
  value = aws_ecs_cluster.main.id
}
