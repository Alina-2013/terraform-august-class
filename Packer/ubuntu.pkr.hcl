packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}



source "amazon-ebs" "ubuntu" {
  ami_name      = "latest-ubuntu {{timestamp}}"
  instance_type = "t2.micro"
  region        = "us-east-1"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-xenial-16.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}







build {
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
  provisioner "shell" {
    inline = [
      "echo Installing Telnet",
      "sudo apt-get install telnet -y",
      "sudo apt update && sudo apt upgrade -y",
    ]
  }
  provisioner "breakpoint" {
    note = "Waiting for your verification"
  }
}
