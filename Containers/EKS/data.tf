data "aws_availability_zones" "all" {}

resource "aws_default_subnet" "default_az1" {
  availability_zone = data.aws_availability_zones.all.names[0]
}

resource "aws_default_subnet" "default_az2" {
  availability_zone = data.aws_availability_zones.all.names[1]
}

resource "aws_default_subnet" "default_az3" {
  availability_zone = data.aws_availability_zones.all.names[2]
}


data "aws_eks_cluster" "cluster" {
  name = module.my-cluster.cluster_id
}
data "aws_eks_cluster_auth" "cluster" {
  name = module.my-cluster.cluster_id
}