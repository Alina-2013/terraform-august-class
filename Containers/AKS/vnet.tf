module "network" {
	version = "3.3.0"
	source = "Azure/network/azurerm"
	resource_group_name = var.aks_config["resource_group_name"]
	address_space = var.aks_config["address_space"]
	subnet_prefixes = var.subnet_prefixes
	subnet_names = var.subnet_names
	depends_on = [azurerm_resource_group.example]
}

