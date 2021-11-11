// module "cluster" {
//   source  = "terraform-aws-modules/rds-aurora/aws"

//   name           = "test-aurora-db-postgres96"
//   engine         = "aurora-postgresql"
//   engine_version = "11.12"
//   instance_class = "db.r6g.large"
//   instances = {
//     one = {}
//     2 = {
//       instance_class = "db.r6g.2xlarge"
//     }
//   }

//   vpc_id  = module.vpc.vpc_id
//   subnets = [module.vpc.private_subnets[0],module.vpc.private_subnets[1],module.vpc.private_subnets[2]]

//   allowed_cidr_blocks     = ["10.20.0.0/20"]

//   storage_encrypted   = true
//   apply_immediately   = true
//   monitoring_interval = 10

//   db_parameter_group_name         = "manual"
//   db_cluster_parameter_group_name = "manual"

//   enabled_cloudwatch_logs_exports = ["postgresql"]

//   tags = var.tags
// }