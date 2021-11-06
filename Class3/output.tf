
output "ubuntu_ami" {
  value = data.aws_ami.ubuntu.id
}
output "centos_ami" {
  value = data.aws_ami.centos.id
}

output "AZ" {
  value = data.aws_availability_zones.all.names
}
