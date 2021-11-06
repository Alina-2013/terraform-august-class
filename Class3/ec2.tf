resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  availability_zone = data.aws_availability_zones.all.names[0]
}

resource "aws_ebs_volume" "example" {
  availability_zone = data.aws_availability_zones.all.names[0]
  size              = 100
}