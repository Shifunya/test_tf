module "postgresql_1" {
  source                  = "./modules/rds"
  identifier              = var.db1_identifier
  db_name                 = var.db1_db_name
  instance_class          = var.db1_instance_class
  allocated_storage       = var.db1_allocated_storage
  engine                  = var.db1_engine
  engine_version          = var.db1_engine_version
  username                = local.rds_user
  password                = local.rds_pass
  vpc_security_group_ids  = [aws_security_group.db_sg.id]
  db_subnet_group_name    = "subnet-db-${var.db1_dbgr_name}"
  backup_retention_period = var.db1_backup_retention_period
  dbgr_name               = var.db1_dbgr_name
  dbgr_identifier         = var.db1_dbgr_identifier
  private_subnet_1_id     = module.vpc.private_subnet_1
  private_subnet_2_id     = module.vpc.private_subnet_2
}
module "postgresql_2" {
  source                  = "./modules/rds"
  identifier              = var.db2_identifier
  db_name                 = var.db2_db_name
  instance_class          = var.db2_instance_class
  allocated_storage       = var.db2_allocated_storage
  engine                  = var.db2_engine
  engine_version          = var.db2_engine_version
  username                = local.rds_user
  password                = local.rds_pass
  vpc_security_group_ids  = [aws_security_group.db_sg.id]
  db_subnet_group_name    = "subnet-db-${var.db2_dbgr_name}"
  backup_retention_period = var.db2_backup_retention_period
  dbgr_name               = var.db2_dbgr_name
  dbgr_identifier         = var.db2_dbgr_identifier
  private_subnet_1_id     = module.vpc.private_subnet_1
  private_subnet_2_id     = module.vpc.private_subnet_2
}

module "elaticache_1" {
  source               = "./modules/elasticache"
  cluster_id           = var.e1_cluster_id
  engine               = var.e1_engine
  node_type            = var.e1_node_type
  num_cache_nodes      = var.e1_num_cache_nodes
  parameter_group_name = var.e1_parameter_group_name
  port                 = var.e1_port
  subnet_group_name    = "subnet-group-${var.e1_cluster_id}"
  private_subnet_1_id  = module.vpc.private_subnet_1
  private_subnet_2_id  = module.vpc.private_subnet_2
  security_group_ids   = [aws_security_group.elasticache_sg.id]
  tag                  = var.e1_tag
  apply_immediately    = var.e1_apply_immediately
}
module "elaticache_2" {
  source               = "./modules/elasticache"
  cluster_id           = var.e2_cluster_id
  engine               = var.e2_engine
  node_type            = var.e2_node_type
  num_cache_nodes      = var.e2_num_cache_nodes
  parameter_group_name = var.e2_parameter_group_name
  port                 = var.e2_port
  subnet_group_name    = "subnet-group-${var.e2_cluster_id}"
  private_subnet_1_id  = module.vpc.private_subnet_2
  private_subnet_2_id  = module.vpc.private_subnet_2
  security_group_ids   = [aws_security_group.elasticache_sg.id]
  tag                  = var.e2_tag
  apply_immediately    = var.e2_apply_immediately
}

module "vpc" {
  source             = "./modules/vpc"
  identifier         = var.vpc_identifier
  vpc_cidr           = var.vpc_cidr
  private_subnet_1   = var.private_subnet_1
  private_subnet_2   = var.private_subnet_2
  public_subnet_1    = var.public_subnet_1
  public_subnet_2    = var.public_subnet_2
  availibilty_zone_1 = var.availibilty_zone_1
  availibilty_zone_2 = var.availibilty_zone_2
}

module "ec2_instance" {
  source                 = "./modules/ec2"
  count                  = 2
  identifier             = "${var.ec2_identifier}-${count.index + 1}"
  ec2_ami                = var.ec2_ami
  ec2_instance_type      = var.ec2_instance_type
  ec2_key_name           = var.ec2_key_name1
  ec2_security_group_ids = [aws_security_group.ec2_sg.id]
  ec2_availibility_zone  = [var.availibilty_zone_1, var.availibilty_zone_2]
  ec2_subnet_id          = module.vpc.public_subnet_1
}

module "bastion" {
  source        = "./modules/bastion"
  key_name      = var.ec2_key_name1
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  subnet_id     = module.vpc.public_subnet_1
  vpc_id        = module.vpc.aws_vpc
}
