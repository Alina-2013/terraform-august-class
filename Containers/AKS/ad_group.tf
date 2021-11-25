# DevOps group to manage cluster
resource "azuread_group" "example" {
	display_name = "DevOps"
	mail_enabled = true
	mail_nickname = "ExampleGroup"
	security_enabled = true
	types = ["Unified"]
	# members = [
	# azuread_user.example.object_id,
     # /* more users */
	# ]
}