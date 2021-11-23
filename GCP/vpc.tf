resource "google_compute_network" "vpc" {
	name = "vpc"
	auto_create_subnetworks = "false"
	routing_mode = "REGIONAL"
}

resource "google_compute_subnetwork" "public_subnet_1" {
	name = "public-subnet1"
	ip_cidr_range = var.vpc_config["subnet1_cidr"]
	network = google_compute_network.vpc.name
}

resource "google_compute_subnetwork" "public_subnet_2" {
	name = "public-subnet2"
	ip_cidr_range = var.vpc_config["subnet2_cidr"]
	network = google_compute_network.vpc.name
}

resource "google_compute_subnetwork" "public_subnet_3" {
	name = "public-subnet3"
	ip_cidr_range = var.vpc_config["subnet3_cidr"]
	network = google_compute_network.vpc.name
}

variable "vpc_config" {
	type = map(any)
	default = {
		vpc_name = "vpc"
		region = "us-central1"
		zone = "us-central1-c"
		subnet1_cidr = "10.0.1.0/24"
		subnet2_cidr = "10.0.2.0/24"
		subnet3_cidr = "10.0.3.0/24"
	}
}


resource "google_compute_network" "vpc2" {
	name = "vpc2"
	auto_create_subnetworks = "true"
	routing_mode = "GLOBAL"
}
