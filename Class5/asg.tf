module "wordpress-asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "~> 4.0"

  # Autoscaling group
  name                        = "example-wordpress-asg"
  min_size                    = 5
  max_size                    = 5
  desired_capacity            = 5
  wait_for_capacity_timeout   = 0
  health_check_type           = "EC2"
  associate_public_ip_address = true
  vpc_zone_identifier = [
    module.vpc.public_subnets[0],
    module.vpc.public_subnets[1],
    module.vpc.public_subnets[2]
  ]

  network_interfaces = [
    {
      delete_on_termination = true
      description           = "eth0"
      device_index          = 0
      security_groups       = [module.wordpress.security_group_id]
    }
  ]

  # Launch template
  lt_name                = "example-asg-lt"
  description            = "Launch template example"
  update_default_version = true
  use_lt                 = true
  create_lt              = true
  image_id               = data.aws_ami.amazon.id
  instance_type          = "t3.micro"
  ebs_optimized          = true
  enable_monitoring      = true
  user_data_base64       = "IyEvYmluL2Jhc2gKc2V0IC14ZQpzdWRvIHl1bSBpbnN0YWxsIGh0dHBkIHBocCBwaHAtbXlzcWwgd2dldCAgLXkKc3VkbyBzeXN0ZW1jdGwgcmVzdGFydCBodHRwZApzdWRvIHN5c3RlbWN0bCBlbmFibGUgaHR0cGQKc3VkbyB3Z2V0ICBodHRwczovL3dvcmRwcmVzcy5vcmcvd29yZHByZXNzLTQuMC4zMi50YXIuZ3oKc3VkbyB0YXIgLXhmIHdvcmRwcmVzcy00LjAuMzIudGFyLmd6IC1DIC92YXIvd3d3L2h0bWwvCnN1ZG8gbXYgL3Zhci93d3cvaHRtbC93b3JkcHJlc3MvKiAvdmFyL3d3dy9odG1sLwpzdWRvIHN5c3RlbWN0bCByZXN0YXJ0IGh0dHBkCnN1ZG8gY2hvd24gLVIgYXBhY2hlOmFwYWNoZSAvdmFyL3d3dy9odG1sLwpzdWRvIHN5c3RlbWN0bCByZXN0YXJ0IGh0dHBk"
  tags_as_map            = var.tags
}