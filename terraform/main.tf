provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./network"
}

module "ecs_cluster" {
  source = "./ecs"
  vpc_id = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
}

module "ecs_service_react" {
  source = "./ecs"
  cluster_id = module.ecs_cluster.cluster_id
  private_subnets = module.vpc.private_subnets
  security_group_id = module.vpc.react_sg_id
  container_name = "react"
  container_image = "your-dockerhub-username/react-app:latest"
  container_port = 80
  desired_count = 1
}

module "ecs_service_strapi" {
  source = "./ecs"
  cluster_id = module.ecs_cluster.cluster_id
  private_subnets = module.vpc.private_subnets
  security_group_id = module.vpc.strapi_sg_id
  container_name = "strapi"
  container_image = "your-dockerhub-username/strapi-app:latest"
  container_port = 1337
  desired_count = 1
}

resource "aws_route53_record" "react" {
  zone_id = "YOUR_ROUTE53_ZONE_ID"
  name = "yourname.contentecho.in"
  type = "A"
  ttl = "300"
  records = [module.ecs_service_react.private_ip]
}

resource "aws_route53_record" "strapi" {
  zone_id = "YOUR_ROUTE53_ZONE_ID"
  name = "yourname-api.contentecho.in"
  type = "A"
  ttl = "300"
  records = [module.ecs_service_strapi.private_ip]
}
