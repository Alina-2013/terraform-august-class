variable "vm_config" {
	type = map
	default = {
		region = "us-central1"
		zone = "us-central1-c"
		instance_name = "terraform-instance"
		machine_type = "f1-micro"
		image = "debian-cloud/debian-9"
		firewall_name = "fw-allow-http"
		network_tags = "webserver"
	}
}

variable "labels" {
	type = map(any)
	default = {
		name = "db"
		env = "dev"
		team = "devops"
		quarter = "first"
		builtby = "me"
	}
}
