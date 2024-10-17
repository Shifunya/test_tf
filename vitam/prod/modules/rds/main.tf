variable "identifier" {}
variable "db_name" {}
variable "instance_class" {}
variable "allocated_storage" {}
variable "engine" {}
variable "engine_version" {}
variable "username" {}
variable "password" {}
variable "vpc_security_group_ids" {}
variable "db_subnet_group_name" {}
variable "backup_retention_period" {}

variable "dbgr_name" {}
variable "dbgr_identifier" {}
variable "private_subnet_1_id" {}
variable "private_subnet_2_id" {}


resource "aws_db_instance" "this" {
  identifier              = var.identifier
  instance_class          = var.instance_class
  engine                  = var.engine
  engine_version          = var.engine_version
  allocated_storage       = var.allocated_storage
  storage_type            = "gp2"
  db_name                 = var.db_name
  username                = var.username
  password                = var.password
  skip_final_snapshot     = true
  vpc_security_group_ids  = var.vpc_security_group_ids
  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
  backup_retention_period = var.backup_retention_period
  publicly_accessible     = false

  tags = {
    Name = var.identifier
  }
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = var.db_subnet_group_name
  subnet_ids = [var.private_subnet_1_id, var.private_subnet_2_id]

  tags = {
    Name = var.dbgr_name
  }
}
