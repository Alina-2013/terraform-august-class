provider "azurerm" {
	features {}
}



data "azuread_domains" "aad_domains" {}


output "domains" {
	value = data.azuread_domains.aad_domains.domains[0].domain_name
}



resource "random_password" "password" {
	length = 30
	special = false
	override_special = "_%@"
}




resource "azuread_user" "example" {
	user_principal_name = "jdoe@${data.azuread_domains.aad_domains.domains[0].domain_name}"
	display_name = "J. Doe"
	given_name = "John"
	surname = "Doe"
	mail_nickname = "jdoe"
	password = random_password.password.result
	company_name = "evolvecyber"
	country = "US"
	city = "Chicago"
	postal_code = 60018
	state = "IL"
	street_address = "312 n State"
	office_location = "Wacker drive"
	job_title = "DevOps"
	mobile_phone = "31213232123"
	department = "IT"
}
