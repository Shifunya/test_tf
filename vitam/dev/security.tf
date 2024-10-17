resource "aws_security_group" "ec2_sg" {
  name                   = "ec2-sg"
  description            = "Security group for ec2"
  vpc_id                 = module.vpc.aws_vpc
  revoke_rules_on_delete = true
}

resource "aws_security_group_rule" "alb_http_ingress" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "TCP"
  description       = "Allow http inbound traffic from internet"
  security_group_id = aws_security_group.ec2_sg.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ec2_all_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  description       = "Allow outbound traffic from ECS"
  security_group_id = aws_security_group.ec2_sg.id
  cidr_blocks       = ["0.0.0.0/0"]
}


resource "aws_security_group" "elasticache_sg" {
  name        = "elasticache-sg"
  description = "Allow access to ElastiCache Redis"
  vpc_id      = module.vpc.aws_vpc
  ingress {
    from_port       = 6379
    to_port         = 6379
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "elasticache-sg"
  }
}

resource "aws_security_group" "db_sg" {
  name        = "db-sg"
  description = "Allow access to PostgreSQL DB"
  vpc_id      = module.vpc.aws_vpc

  ingress {
    from_port = 5432
    to_port   = 5432
    protocol  = "tcp"
    security_groups = [
      aws_security_group.ec2_sg.id,     # Allow access from ECS security group
      module.bastion.aws_security_group # Allow access from Bastion Host security group
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "db-sg"
  }
}
