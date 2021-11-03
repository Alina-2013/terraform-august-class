resource "aws_key_pair" "class" {
	key_name = "class-key"
	public_key = file("~/.ssh/id_rsa.pub")
}


resource "aws_instance" "web" {
	ami = "ami-01cc34ab2709337aa"
	instance_type = "t2.micro"
    key_name = aws_key_pair.class.key_name
}
