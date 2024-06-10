module "rds" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "7.6.0"

  engine         = var.engine
  engine_version = var.engine_version
  instance_class = var.instance_class

  vpc_id             = var.vpc_id
  subnets            = var.subnets
  create_security_group = var.create_security_group

  database_name = var.database_name
  master_username = var.master_username
  master_password = var.master_password

  vpc_security_group_ids = [aws_security_group.rds_security_group.id]

  tags = var.tags
}

resource "aws_security_group" "rds_security_group" {
  name_prefix = "rds-security-group-"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.autoscaling_security_group_id]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = var.tags
}