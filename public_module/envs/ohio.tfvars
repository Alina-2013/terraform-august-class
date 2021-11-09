region = "us-east-2"
vpc_name = "ohio"
vpc_cidr = "192.168.0.0/16"
private_subnet1 = "192.168.1.0/24"
private_subnet2 = "192.168.2.0/24"
private_subnet3 = "192.168.3.0/24"
public_subnet1 = "192.168.101.0/24"
public_subnet2 = "192.168.102.0/24"
public_subnet3 = "192.168.103.0/24"
tags = {
    Terraform   = "true"
    Environment = "dev"
}