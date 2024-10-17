#################################################################################################
# ElastiCache setup
#################################################################################################

variable "cluster_id" {}
variable "engine" {}
variable "node_type" {}
variable "num_cache_nodes" {}
variable "parameter_group_name" {}
variable "port" {}
variable "subnet_group_name" {}
variable "private_subnet_1_id" {}
variable "private_subnet_2_id" {}
variable "security_group_ids" {}
variable "apply_immediately" {}
variable "tag" {}



resource "aws_elasticache_cluster" "redis_cluster" {
  cluster_id           = var.cluster_id
  engine               = var.engine
  node_type            = var.node_type 
  num_cache_nodes      = var.num_cache_nodes  
  parameter_group_name = var.parameter_group_name
  port                 = var.port
  subnet_group_name    = aws_elasticache_subnet_group.elasticache_subnet_group.name
  security_group_ids   = var.security_group_ids 

  apply_immediately = var.apply_immediately

  tags = {
    Name = var.tag
  }

}

resource "aws_elasticache_subnet_group" "elasticache_subnet_group" {
  name       = var.subnet_group_name
  subnet_ids = [var.private_subnet_1_id, var.private_subnet_2_id]

  tags = {
    Name = "elasticache-subnet-group"
  }
}
