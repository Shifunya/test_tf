#################################################################################################
# Used non sensetive variables values
#################################################################################################

#rds
db1_identifier              = "sfero-postgresql-db-1"
db1_db_name                 = "sferodatabase1"
db1_instance_class          = "db.t3.micro"
db1_allocated_storage       = 20
db1_engine                  = "postgres"
db1_engine_version          = "16.3"
db1_backup_retention_period = 7
db1_dbgr_name               = "db1-subnet-gr"
db1_dbgr_identifier         = "db1"

db2_identifier              = "sfero-postgresql-db-2"
db2_db_name                 = "sferodatabase2"
db2_instance_class          = "db.t3.micro"
db2_allocated_storage       = 20
db2_engine                  = "postgres"
db2_engine_version          = "16.3"
db2_backup_retention_period = 7
db2_dbgr_name               = "db2-subnet-gr"
db2_dbgr_identifier         = "db2"

#Test values for vpc
vpc_identifier     = "vpc-prod"
private_subnet_1   = "10.0.80.0/20"
private_subnet_2   = "10.0.112.0/20"
public_subnet_1    = "10.0.16.0/20"
public_subnet_2    = "10.0.32.0/20"
availibilty_zone_1 = "eu-west-3a"
availibilty_zone_2 = "eu-west-3b"
vpc_cidr           = "10.0.0.0/16"
region             = "eu-west-3"

#Test values for ec2
ec2_identifier    = "ec2-prod"
ec2_ami           = "ami-045a8ab02aadf4f88"
ec2_instance_type = "t3.medium"
ssh1              = "./data/key/test.pem"
ec2_key_name1     = "prod-key"

#Elasticache
e1_cluster_id           = "redis-cluster1"
e1_engine               = "redis"
e1_node_type            = "cache.t2.micro"
e1_num_cache_nodes      = 1
e1_parameter_group_name = "default.redis7"
e1_port                 = 6379
e1_tag                  = "elasticache_1"
e1_apply_immediately    = true

e2_cluster_id           = "redis-cluster2"
e2_engine               = "redis"
e2_node_type            = "cache.t2.micro"
e2_num_cache_nodes      = 1
e2_parameter_group_name = "default.redis7"
e2_port                 = 6379
e2_tag                  = "elasticache_2"
e2_apply_immediately    = true
