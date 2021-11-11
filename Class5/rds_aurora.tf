module "cluster" {
  source = "terraform-aws-modules/rds-aurora/aws"

  name           = "test-aurora-db-mysql"
  engine         = "aurora-mysql"
  engine_version = "5.7"
  instance_class = "db.r5.large"
  instances = {
    one = {}
    2 = {
      instance_class = "db.r5.large"
    }
  }

  vpc_id = module.vpc.vpc_id
  subnets = [
    module.vpc.private_subnets[0],
    module.vpc.private_subnets[1],
    module.vpc.private_subnets[2]
  ]

  allowed_cidr_blocks             = ["10.20.0.0/20"]
  storage_encrypted               = true
  apply_immediately               = true
  monitoring_interval             = 10
  db_parameter_group_name         = "default.aurora-mysql5.7"
  db_cluster_parameter_group_name = "default.aurora-mysql5.7"
  tags                            = var.tags
}