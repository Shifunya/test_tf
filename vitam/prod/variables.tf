#################################################################################################
# Used non sensetive variables defenitions
#################################################################################################

#---------------main vars-------------------

variable "region" {
  description = "Main region for all resources"
  type        = string
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the main VPC"
}

variable "public_subnet_1" {
  type        = string
  description = "CIDR block for public subnet 1"
}

variable "public_subnet_2" {
  type        = string
  description = "CIDR block for public subnet 2"
}

variable "private_subnet_1" {
  type        = string
  description = "CIDR block for private subnet 1"
}

variable "private_subnet_2" {
  type        = string
  description = "CIDR block for private subnet 2"
}

variable "availibilty_zone_1" {
  type        = string
  description = "First availibility zone"
}

variable "availibilty_zone_2" {
  type        = string
  description = "First availibility zone"
}

variable "default_tags" {
  type = map(any)
  default = {
    Application = "Demo App"
    Environment = "Prod"
  }
}
#----------------------------------------------
#-------------rds vars-------------------------

variable "db1_identifier" {}
variable "db1_db_name" {}
variable "db1_instance_class" {}
variable "db1_allocated_storage" {}
variable "db1_engine" {}
variable "db1_engine_version" {}
variable "db1_backup_retention_period" {}
variable "db1_dbgr_name" {}
variable "db1_dbgr_identifier" {}

variable "db2_identifier" {}
variable "db2_db_name" {}
variable "db2_instance_class" {}
variable "db2_allocated_storage" {}
variable "db2_engine" {}
variable "db2_engine_version" {}
variable "db2_backup_retention_period" {}
variable "db2_dbgr_name" {}
variable "db2_dbgr_identifier" {}
#----------------------------------------------
#-------------vpc vars-------------------------

variable "vpc_identifier" {}
#----------------------------------------------
#-------------ec2 vars-------------------------

variable ec2_identifier {}
variable ec2_ami {}
variable ec2_instance_type {}
variable "ssh1" {}
variable "ec2_key_name1" {}
#----------------------------------------------
#-------------elastic vars-------------------------

# ElastiCache Redis creation

variable e1_cluster_id {}
variable e1_engine {}
variable e1_node_type {}
variable e1_num_cache_nodes {}
variable e1_parameter_group_name {}
variable e1_port {}
variable e1_tag {}
variable "e1_apply_immediately" {}

variable e2_cluster_id {}
variable e2_engine {}
variable e2_node_type {}
variable e2_num_cache_nodes {}
variable e2_parameter_group_name {}
variable e2_port {}
variable e2_tag {}
variable "e2_apply_immediately" {}
