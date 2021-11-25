resource "google_container_cluster" "primary" {
    depends_on = [
      null_resource.enable-compute-services,
      null_resource.enable-dns-services,
      null_resource.enable-storage-services,
      null_resource.enable-container-services
    ]
	name = var.gke_config["cluster_name"]
	location = var.gke_config["region"]
	remove_default_node_pool = false
	initial_node_count = 1
	master_auth {
		client_certificate_config {
		issue_client_certificate = false
		}
	}
}


resource "google_container_node_pool" "primary_preemptible_nodes" {
    depends_on = [
      null_resource.enable-compute-services,
      null_resource.enable-dns-services,
      null_resource.enable-storage-services,
      null_resource.enable-container-services
    ]
	name = var.gke_config["node_pool_name"]
	location = var.gke_config["region"]
	cluster = google_container_cluster.primary.name
	node_count = var.gke_config["node_count"]
	node_config {
		preemptible = var.gke_config["preemptible"]
		machine_type = var.gke_config["machine_type"]
	metadata = {
		disable-legacy-endpoints = "true"
	}
	oauth_scopes = [
	"https://www.googleapis.com/auth/cloud-platform"
		]
	}
}
