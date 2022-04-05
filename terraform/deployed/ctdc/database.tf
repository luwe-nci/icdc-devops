module "ctdc_database" {
  source = "./modules/database"
  
  stack_name = var.stack_name
  tags = var.tags
  ssh_key_name = var.ssh_key_name
  ssh_user = var.ssh_user
  private_subnet_ids = var.private_subnet_ids
  subnet_ip_block = var.subnet_ip_block
  db_private_ip = var.db_private_ip
  vpc_id = var.vpc_id

}
