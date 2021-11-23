data "google_billing_account" "acct" {
	display_name = "dev"
	open = true
}

output "billing_account_id" {
    value = data.google_billing_account.acct.id
}


resource "random_password" "password" {
	length = 16
	number = false
	special = false
	lower = true
	upper = false
}

output "randompassword" {
    value = random_password.password.result
}

resource "google_project" "testproject" {
	name = "testproject"
	project_id = random_password.password.result
	billing_account = data.google_billing_account.acct.id
}
