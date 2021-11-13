module "elb_http" {
  source  = "terraform-aws-modules/elb/aws"
  version = "~> 2.0"

  name = "elb-example"

  subnets         = [module.vpc.public_subnets[0], module.vpc.public_subnets[1], module.vpc.public_subnets[2]]
  security_groups = [module.wordpress.security_group_id]
  internal        = false

  listener = [
    {
      instance_port     = 80
      instance_protocol = "HTTP"
      lb_port           = 80
      lb_protocol       = "HTTP"
    }
  ]


  health_check = {
    target              = "TCP:80"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }

  tags = var.tags
}



resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = module.wordpress-asg.autoscaling_group_id
  elb                    = module.elb_http.this_elb_id
}


output "elb" {
  value = module.elb_http.*
}