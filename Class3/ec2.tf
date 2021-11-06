resource "aws_instance" "web" {
  ami               = data.aws_ami.centos.id
  instance_type     = "t3.micro"
  availability_zone = data.aws_availability_zones.all.names[0]
  provisioner "remote-exec" {
    connection {
      host        = aws_instance.web.public_ip
      type        = "ssh"
      user        = "centos"
      private_key = file("~/.ssh/id_rsa")
    }
    inline = [
      "sudo yum install -y epel-release -y",
      "sudo yum install httpd -y",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
      "sudo yum install telnet -y"
    ]
  }
}