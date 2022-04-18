public_subnet_ids = []
private_subnet_ids = [
  "subnet-8832f6d5",
  "subnet-819c02e5"
]
vpc_id = "vpc-29a12251"
stack_name = "cds"
app_name = "cds"
domain_name = "cancer.gov"

tags = {
  Project = "cds"
  CreatedWith = "Terraform"
  POC = "ye.wu@nih.gov"
  Environment = "dev"
}
fargate_security_group_ports = ["80","443","3306","7473","7474","9200","7687"]
certificate_domain_name = "*.cancer.gov"
allowed_subnet_ip_block = ["10.208.8.0/21"]
app_sub_domain = "cds"
elasticsearch_version = "OpenSearch_1.1"
region = "us-east-1"
elasticsearch_instance_type = "t3.medium.elasticsearch"
create_es_service_role = false
internal_alb = true
app_ecr_registry_names = ["backend","frontend"]
microservices  = {
  frontend = {
    name = "frontend"
    port = 80
    health_check_path = "/"
    priority_rule_number = 22
    image_url = "cbiitssrepo/bento-frontend:latest"
    cpu = 256
    memory = 512
    path = "/*"
  },
  backend = {
    name = "backend"
    port = 8080
    health_check_path = "/ping"
    priority_rule_number = 20
    image_url = "cbiitssrepo/bento-backend:latest"
    cpu = 512
    memory = 1024
    path = "/v1/graphql/*"
  }
}
cloud_platform = "cloudone"
create_dns_record = false