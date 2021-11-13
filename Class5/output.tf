output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "ami_id" {
  value = data.aws_ami.amazon.id
}

output "security_group_id" {
  value = module.wordpress.security_group_id
}

// output lb_name {
//   value = module.elb_http.elb_dns_name
// }

output "reader" {
  value = module.cluster.cluster_reader_endpoint
}


output "writer" {
  value = module.cluster.cluster_endpoint
}