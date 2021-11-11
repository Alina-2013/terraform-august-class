module "wordpress" {
  source      = "terraform-aws-modules/security-group/aws"
  name        = "wordpress"
  description = "Security group for wordpress with custom ports open within VPC, and PostgreSQL publicly open"
  vpc_id      = module.vpc.vpc_id
  ingress_cidr_blocks = [
    "10.10.0.0/16",
    "127.0.0.1/32",
    "172.0.0.1/32",
    "0.0.0.0/0",

  ]
  ingress_rules = [
    "https-443-tcp",
    "http-80-tcp",
  ]
  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules       = ["all-all"]
  tags               = var.tags
}