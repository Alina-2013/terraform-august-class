module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = var.vpc_name
  cidr   = var.vpc_cidr
  azs = [
    data.aws_availability_zones.available.names[0],
    data.aws_availability_zones.available.names[1],
    data.aws_availability_zones.available.names[2],
  ]
  private_subnets = [
    var.private_subnet1,
    var.private_subnet2,
    var.private_subnet3,
  ]
  public_subnets = [
    var.public_subnet1,
    var.public_subnet2,
    var.public_subnet3,
  ]
  enable_nat_gateway = true
  tags               = var.tags
}