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
  vpc_zone_identifier       = [
      module.vpc.private_subnets[0],
      module.vpc.private_subnets[1],
      module.vpc.private_subnets[2]
    ]

    network_interfaces = [
        {
        delete_on_termination = true
        description           = "eth0"
        device_index          = 0
        security_groups       = [module.wordpress.security_group_id]
        },
        {
        delete_on_termination = true
        description           = "eth1"
        device_index          = 1
        security_groups       = [module.wordpress.security_group_id]
        }
    ]

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
  user_data_base64	= "IyEvYmluL2Jhc2ggIApzdWRvIHl1bSBpbnN0YWxsIGh0dHBkIHBocCBwaHAtbXlzcWwgd2dldCAgLXkgCnN1ZG8gc3lzdGVtY3RsIHJlc3RhcnQgaHR0cGQgCnN1ZG8gc3lzdGVtY3RsIGVuYWJsZSBodHRwZCAKd2dldCAgaHR0cHM6Ly93b3JkcHJlc3Mub3JnL3dvcmRwcmVzcy00LjAuMzIudGFyLmd6CnN1ZG8gdGFyIC14ZiB3b3JkcHJlc3MtNC4wLjMyLnRhci5neiAtQyAvdmFyL3d3dy9odG1sLyAKc3VkbyBtdiAvdmFyL3d3dy9odG1sL3dvcmRwcmVzcy8qIC92YXIvd3d3L2h0bWwvIApzdWRvIHN5c3RlbWN0bCByZXN0YXJ0IGh0dHBkIApzdWRvIGNob3duIC1SIGFwYWNoZTphcGFjaGUgL3Zhci93d3cvaHRtbC8Kc3VkbyBzeXN0ZW1jdGwgcmVzdGFydCBodHRwZAo="
  tags_as_map = var.tags
}