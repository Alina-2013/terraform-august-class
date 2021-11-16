packer {
	required_plugins {
		amazon = {
			version = ">= 0.0.1"
			source = "github.com/hashicorp/amazon"
		}
	}
}

variable "ssh_private_key_file" {
    default = "~/.ssh/id_rsa"
}
variable "ssh_keypair_name" {
    default = "bastion"
}
variable "source_ami_name" {
    default = "centos"
}
variable "instance_type" {
    default = "t2.micro"
}
variable "ssh_username" {
    default = "ec2-user"
}
variable "ami_name" {
    default = "bastion"
}
variable "region" {
    default = "us-east-1"
}
variable "owners" {
    default = "self"
}



source "amazon-ebs" "image" {
	ami_name             = "${var.ami_name} {{timestamp}}"
	ssh_private_key_file = "${var.ssh_private_key_file}"
	ssh_keypair_name     = "${var.ssh_keypair_name}"
	instance_type        = "${var.instance_type}"
	ssh_username         = "${var.ssh_username}"
	region               = "${var.region}"
	source_ami_filter {
		most_recent = true
		owners      = ["${var.owners}"]
		filters = {
			name                = "${var.source_ami_name}"
			virtualization-type = "hvm"
			root-device-type    = "ebs"
		}
	}
	run_tags = {
		Name = "Packer instance for ${var.source_ami_name}"
	}
}




build {
	sources = [
		"source.amazon-ebs.image"
	]
	provisioner "shell" {
		inline = [
			"echo Installing Telnet",
			"sudo yum install telnet -y"   #Change for ubuntu
		]
	}
	provisioner "breakpoint" {
		note = "Waiting for your verification"
	}
}

