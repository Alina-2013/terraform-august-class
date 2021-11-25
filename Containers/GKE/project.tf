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

resource "null_resource" "unset-project" {
	provisioner "local-exec" {
	when = destroy
	command = "gcloud config unset project"
	}
}
