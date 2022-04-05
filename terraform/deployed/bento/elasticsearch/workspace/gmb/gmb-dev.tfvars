#define any tags appropriate to your environment
tags = {
  ManagedBy = "terraform"
  Project = "GMB"
  Environment = "dev"
  POC = "ye.wu@nih.gov"
}
#enter the region in which your aws resources will be provisioned
region = "us-east-1"

#specify the name you will like to call this project.
stack_name = "gmb"

elasticsearch_instance_type = "t3.medium.elasticsearch"

private_subnet_ids = ["subnet-09b0c7407416d4730"]

vpc_id = "vpc-08f154f94dc8a0e34"

subnet_ip_block = ["172.18.0.0/16","172.16.0.219/32"]

create_es_service_role = false