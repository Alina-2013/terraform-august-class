packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}



source "amazon-ebs" "ubuntu" {
  ami_name      = "q4ami {{timestamp}}"
  ami_users = [
	  "189967482845",
	  "648963207511",
	  "034052071505",
	  "045272241161",
	  ]
	ami_regions = [
	  "us-east-1",
	  "us-west-1",
	  "us-west-2",
	  "eu-west-1",
	  "ap-southeast-1",
	  "ap-southeast-2",
	  "ap-northeast-1",
	  "sa-east-1",
	  ]
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
