data "google_billing_account" "acct" {
	display_name = "dev"
	open = true
}

output "billing_account_id" {
    value = data.google_billing_account.acct.id
}