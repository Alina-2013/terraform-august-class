
resource "aws_key_pair" "class" {
  key_name   = var.key_name
  public_key = file("~/.ssh/id_rsa.pub")
}




resource "aws_security_group" "allow_tls" {
  name        = var.sec_group_name
  description = "Allow TLS inbound traffic"
  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "TLS from VPC"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "web" {
  ami                    = data.aws_ami.centos.id
  instance_type          = var.instance_type
  availability_zone      = data.aws_availability_zones.all.names[0]
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  key_name               = aws_key_pair.class.key_name
}

resource "aws_instance" "web2" {
  ami                    = data.aws_ami.centos.id
  instance_type          = var.instance_type
  availability_zone      = data.aws_availability_zones.all.names[0]
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  key_name               = aws_key_pair.class.key_name
}

resource "null_resource" "commands" {
  depends_on = [aws_instance.web, aws_security_group.allow_tls]
  triggers = {
    always_run = timestamp()
  }
  # Push files to remote server
  provisioner "file" {
    connection {
      host        = aws_instance.web2.public_ip
      type        = "ssh"
      user        = "centos"
      private_key = file("~/.ssh/id_rsa")
    }
    source      = "r1soft.repo"
    destination = "/tmp/r1soft.repo"
  }
  # Execute linux commands on remote machine
  provisioner "remote-exec" {
    connection {
      host        = aws_instance.web2.public_ip
      type        = "ssh"
      user        = "centos"
      private_key = file("~/.ssh/id_rsa")
    }
    inline = [
      "sudo yum install -y epel-release -y",
      "sudo yum install httpd -y",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
      "sudo cp /tmp/r1soft.repo /etc/yum.repos.d/r1soft.repo",
      "sudo yum install telnet -y",
      "sudo yum install elinks -y",
      "sudo mkdir  /tmp/testfolder",
      "echo Hello"
    ]
  }
}
