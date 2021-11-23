
resource "google_filestore_instance" "instance" {
	provider = google-beta
	name = var.fs_config["filestore_name"]
	zone = var.fs_config["zone"]
	tier = var.fs_config["tier"]
	file_shares {
		capacity_gb = var.fs_config["capacity_gb"]
		name = var.fs_config["file_share_name"]
		nfs_export_options {
			ip_ranges = ["0.0.0.0/0"]
			access_mode = "READ_WRITE"
			squash_mode = "NO_ROOT_SQUASH"
		}
	}
	networks {
		network = "default"
		modes = ["MODE_IPV4"]
	}
	labels = var.labels
}

variable "fs_config" {
	type = map(any)
	default = {
		region = "us-central1"
		zone = "us-central1-c"
		filestore_name = "nfsserver"
		capacity_gb = 1024
		tier = "BASIC_HDD"
		file_share_name = "share1"
	}
}

output "ID" {
	value = google_filestore_instance.instance.id
}