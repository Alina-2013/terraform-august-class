resource "aws_key_pair" "class" {
	key_name = "class-key"
	public_key = file("~/.ssh/id_rsa.pub")
    tags = {
        Name = "HelloWorld"
        Env = "Dev"
        Team = "DevOps"
    }
}

resource "aws_security_group" "class-sec-group" {
  name        = "class-sec-group"
  description = "Allow TLS inbound traffic"
  ingress = [
    {
      description      = "TLS from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  ]

  tags = {
    Name = "allow_tls"
  }
}


resource "aws_instance" "web" {
	ami = "ami-01cc34ab2709337aa"
	instance_type = "t2.micro"
    key_name = aws_key_pair.class.key_name
    tags = {
        Name = "HelloWorld"
        Env = "Dev"
        Team = "DevOps"
    }
}
