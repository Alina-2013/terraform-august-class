
resource "google_compute_target_pool" "foobar" {
	region = var.asg_config["region"]
	name = var.asg_config["target-pool-name"]
}


resource "google_compute_autoscaler" "foobar" {
	zone = var.asg_config["zone"]
	name = var.asg_config["autoscaler"]
	target = google_compute_instance_group_manager.foobar.id
	autoscaling_policy {
		max_replicas = var.asg_config["max_replicas"]
		min_replicas = var.asg_config["min_replicas"]
		cooldown_period = var.asg_config["cooldown_period"]
	cpu_utilization {
		target = var.asg_config["target"]
		}
	}
}


resource "google_compute_instance_group_manager" "foobar" {
	zone = var.asg_config["zone"]
	name = var.asg_config["instance_group_manager_name"]
	version {
		instance_template = google_compute_instance_template.foobar.id
		name = "primary"
	}
	target_pools = [google_compute_target_pool.foobar.self_link]
		base_instance_name = "foobar"
	}


resource "google_compute_instance_template" "foobar" {
	name = var.asg_config["instance_template_name"]
	machine_type = var.asg_config["machine_type"]
	can_ip_forward = false
	disk {
		source_image = var.asg_config["source_image"]
	}
	network_interface {
		network = "default"
		access_config {
		}
	}
}

variable "asg_config" {
	type = map(any)
	default = {
		region = "us-central1"
		zone = "us-central1-c"
		target-pool-name = "my-target-pool"
		autoscaler = "my-autoscaler"
		max_replicas = 5
		min_replicas = 1
		cooldown_period = 60
		target = 0.5
		instance_group_manager_name = "my-igm"
		instance_template_name = "my-instance-template"
		machine_type = "e2-medium"
		source_image = "debian-cloud/debian-9"
	}
}