module "wordpress-asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "~> 4.0"

  # Autoscaling group
  name = "example-wordpress-asg"
  min_size                  = 0
  max_size                  = 1
  desired_capacity          = 1
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  vpc_zone_identifier       = [module.vpc.private_subnets]

  # Launch template
  lt_name                = "example-asg-lt"
  description            = "Launch template example"
  update_default_version = true
  use_lt    = true
  create_lt = true
  image_id          = data.aws_ami.ubuntu.id
  instance_type     = "t3.micro"
  ebs_optimized     = true
  enable_monitoring = true
  tags_as_map = var.tags
}