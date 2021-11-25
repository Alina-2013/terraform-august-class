data "google_billing_account" "acct" {
	display_name = "dev"
	open = true
}

resource "random_password" "password" {
	length = 16
	number = false
	special = false
	lower = true
	upper = false
}

resource "google_project" "gkeproject" {
	name = "gkeproject"
	project_id = random_password.password.result
	billing_account = data.google_billing_account.acct.id
}

resource "null_resource" "set-project" {
	provisioner "local-exec" {
	command = "gcloud config set project ${google_project.gkeproject.project_id}"
	}
}

resource "null_resource" "enable-compute-services" {
    depends_on = [
      google_project.gkeproject
    ]
	provisioner "local-exec" {
	command = <<-EOT
        gcloud services enable compute.googleapis.com
        EOT
	}
}

resource "null_resource" "enable-dns-services" {
    depends_on = [
      google_project.gkeproject
    ]
	provisioner "local-exec" {
	command = <<-EOT
        gcloud services enable dns.googleapis.com
        EOT
	}
}

resource "null_resource" "enable-storage-services" {
    depends_on = [
      google_project.gkeproject
    ]
	provisioner "local-exec" {
	command = <<-EOT
        gcloud services enable storage-api.googleapis.com
        EOT
	}
}

resource "null_resource" "enable-container-services" {
    depends_on = [
      google_project.gkeproject
    ]
	provisioner "local-exec" {
	command = <<-EOT
        gcloud services enable container.googleapis.com
        EOT
	}
}
