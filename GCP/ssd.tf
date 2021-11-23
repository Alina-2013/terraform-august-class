resource "google_compute_disk" "default" {
	name = var.config["name"]
	type = var.config["type"]
	zone = var.config["zone"]
	size = var.config["size"]
	labels = {
		environment = var.config["environment"]
	}
}

resource "google_compute_attached_disk" "default" {
	disk = google_compute_disk.default.id
	instance = google_compute_instance.vm_instance.id
}
