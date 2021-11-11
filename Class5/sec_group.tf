module "wordpress" {
  source = "terraform-aws-modules/security-group/aws"
  name        = "wordpress"
  description = "Security group for wordpress with custom ports open within VPC, and PostgreSQL publicly open"
  vpc_id      = module.vpc.vpc_id
  ingress_cidr_blocks      = ["10.10.0.0/16"]
  ingress_rules            = ["https-443-tcp"]
}