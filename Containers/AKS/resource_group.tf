resource "azurerm_resource_group" "example" {
	name = var.aks_config["resource_group_name"]
	location = var.aks_config["location"]
}
